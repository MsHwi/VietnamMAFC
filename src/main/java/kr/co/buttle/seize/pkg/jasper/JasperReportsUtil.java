package kr.co.buttle.seize.pkg.jasper;

import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanArrayDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;

public final class JasperReportsUtil {

    public static final String KEY_DATA = "data";
    public static final String KEY_FORMAT = CBJasperReportsMultiFormatView.DEFAULT_FORMAT_KEY;
    public static final String KEY_FILE_NAME = CBJasperReportsMultiFormatView.DEFAULT_FILE_NAME_KEY;

    public static final String JR_FORMAT_CSV = CBJasperReportsMultiFormatView.JR_FORMAT_CSV;
    public static final String JR_FORMAT_HTML = CBJasperReportsMultiFormatView.JR_FORMAT_HTML;
    public static final String JR_FORMAT_PDF = CBJasperReportsMultiFormatView.JR_FORMAT_PDF;
    public static final String JR_FORMAT_XLS = CBJasperReportsMultiFormatView.JR_FORMAT_XLS;
    public static final String JR_FORMAT_XLSX = CBJasperReportsMultiFormatView.JR_FORMAT_XLSX;
    public static final String JR_FORMAT_DOCX = CBJasperReportsMultiFormatView.JR_FORMAT_DOCX;

    public static final String DEFAULT_ROOT_PATH = "reports/";

    private JasperReportsUtil() {
    }

    @SuppressWarnings("rawtypes")
    public static JRDataSource convertReportData(Object value) throws IllegalArgumentException {
        if (value instanceof JRDataSource) {
            return (JRDataSource) value;
        } else if (value instanceof Collection) {
            return new JRBeanCollectionDataSource((Collection) value);
        } else if (value instanceof Object[]) {
            return new JRBeanArrayDataSource((Object[]) value);
        } else {
            Object[] array = new Object[1];
            array[0] = value;
            return new JRBeanArrayDataSource(array);
        }
    }

    public static ModelAndView render(String viewName, Map<String, ?> parameter, Object reportData, String fileName,
            String format) {
        return render(DEFAULT_ROOT_PATH, viewName, parameter, reportData, fileName, format);
    }

    public static ModelAndView render(String rootPath, String viewName, Map<String, ?> parameter, Object reportData,
            String fileName, String format) {
        if (!rootPath.endsWith("/")) {
            rootPath += "/";
        }

        ModelAndView mav = new ModelAndView(rootPath + viewName, parameter);
        mav.addObject(KEY_FILE_NAME, fileName);
        mav.addObject(KEY_FORMAT, format);
        mav.addObject(KEY_DATA, convertReportData(reportData));

        return mav;
    }
    
    public static void print(HttpServletRequest request, String viewName, Map<String, ?> parameter, Object reportData) throws JRException {
        print(DEFAULT_ROOT_PATH, request, viewName, parameter, reportData);
    }

    public static void print(String rootPath, HttpServletRequest request, String viewName, Map<String, ?> parameter, Object reportData) throws JRException {
        if (!rootPath.endsWith("/")) {
            rootPath += "/";
        }
        
        String jasperFile = "WEB-INF/classes/" + rootPath + viewName + ".jrxml";
        String jasperPath = request.getServletContext().getRealPath(jasperFile);
		JasperDesign jasperDesign = JRXmlLoader.load(jasperPath);
        JasperReport jasperReport;
		jasperReport = JasperCompileManager.compileReport(jasperDesign);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, (Map<String, Object>) parameter, convertReportData(reportData));
        JasperPrintManager.printReport(jasperPrint, false);
//		JasperViewer.viewReport(jasperPrint, true);


    }

}
