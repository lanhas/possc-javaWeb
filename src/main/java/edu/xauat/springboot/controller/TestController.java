package edu.xauat.springboot.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.*;

@Controller
public class TestController {
    String pyInterpreterPath = "C:/Anaconda3/envs/pytorch/python.exe";
    String pyProjectRootPath = "F:/code/python/data_mining/possc-pytorch";
    //	获取训练好的模型
    @RequestMapping(value="/getModel", method= RequestMethod.POST)
    @ResponseBody
    public List<String> getmodel(@RequestParam(value="steelType")String steelType, @RequestParam(value="stoveNum")String stoveNum) throws IOException {
        String modelpath=pyProjectRootPath + "/model_data/" + steelType + '_' +stoveNum + '#' ;
        String folder=pyProjectRootPath + "/model_data/" + steelType + '_' +stoveNum + '#';
        File dir=new File(modelpath);
        File file[]=dir.listFiles();//用file对象的slistFiles()方法返回指定目录下的文件
        List<String> modelList=new ArrayList<String>();
        for(int i=0;i<file.length;i++)
        {
            if(file[i].isFile() && file[i].toString().substring(file[i].toString().length()-4,file[i].toString().length()).compareTo("json")!=0){
                String model=new String(file[i].toString().substring(folder.length()+1,file[i].toString().length()-4));
                /* out.print("<br>"+model); */
	           	/* Map<Integer,String> modelList=new HashMap<Integer,String>();
	            modelList.put(i,model);*/

                modelList.add(model);
                System.out.println(modelList.toString());
            }
        }
//	    request.setAttribute("modelList",modelList);
        return modelList;
    }



    @RequestMapping("/train")
    public String train(HttpServletRequest request, Model model) throws Exception {
        String[] input_train;
        String[] output_train;
        input_train = request.getParameterValues("input_train");
        output_train = request.getParameterValues("output_train");
        Set<String> set_input = new HashSet<>(Arrays.asList(input_train));
        Set<String> set_output = new HashSet<>(Arrays.asList(output_train));
        String input_columns =  String.join(",", set_input);
        String output_columns =  String.join(",", set_output);

        String steelType_train = (String) request.getParameter("steelType_train");
        String stoveNum_train = (String) request.getParameter("stoveNum_train");
        String[] cmds = new String[] {pyInterpreterPath, pyProjectRootPath + "/possc.py", "-t", steelType_train, stoveNum_train, input_columns, output_columns};
        String str = getOutput(cmds);
        model.addAttribute("text", str);
        return "test";
    }

    @RequestMapping("/test")
    public String test(HttpServletRequest request, Model model) throws Exception {
        String[] cmds;
        String[] input_textedit;
        String[] input_test;
        List list = new ArrayList();
        input_test = request.getParameterValues("input_test");
        String flag = request.getParameter("test_flag");
        input_textedit = request.getParameterValues("textedit_test");
        for(int i=0; i < input_textedit.length;i++){
            if(input_textedit[i] != null){
                list.add(input_textedit[i]);
            }
        }
        String textedit_str = listToString(list);
        System.out.println(textedit_str);
        String steelType_test = request.getParameter("steelType_test");
        String stoveNum_test = request.getParameter("stoveNum_test");
        String modelSelect_test = request.getParameter("modelSelect_test");
        Set<String> set_input = new HashSet<>(Arrays.asList(input_test));
        String input_columns =  String.join(",", set_input);
        if(flag!=null){
            cmds = new String[] {pyInterpreterPath, pyProjectRootPath + "/possc.py", "-p", steelType_test, stoveNum_test, textedit_str, modelSelect_test};
        }
        else{
            cmds = new String[] {pyInterpreterPath, pyProjectRootPath + "/possc.py", "-e", steelType_test, stoveNum_test, modelSelect_test};
        }
        String str = getOutput(cmds);
        model.addAttribute("text", str);
        return "test";
    }

    @RequestMapping("/regression")
    public String regression(HttpServletRequest request, Model model) throws Exception {
        String[] cmds;
        String[] input_textedit;
        List list = new ArrayList();
        String[] input_train;
        input_textedit = request.getParameterValues("textedit_regression");
        for(int i=0; i < input_textedit.length;i++){
            if(input_textedit[i] != null){
                list.add(input_textedit[i]);
            }
        }
        String textedit_str = listToString(list);
        System.out.println(textedit_str);
        input_train = request.getParameterValues("input_regression");
        Set<String> set_input = new HashSet<>(Arrays.asList(input_train));
        String input_columns =  String.join(",", set_input);
        String steelType_regression = request.getParameter("steelType_regression");
        String stoveNum_regression = request.getParameter("stoveNum_regression");
        String flag = request.getParameter("regression_flag");
        String outputSelect_regression = request.getParameter("outputSelect_regression");
        System.out.println(input_columns);
        System.out.println(outputSelect_regression);
        if(flag!=null){
            cmds = new String[] {pyInterpreterPath, pyProjectRootPath + "/possc.py", "-l", steelType_regression, stoveNum_regression, input_columns, outputSelect_regression, textedit_str};
        }
        else{
            cmds = new String[] {pyInterpreterPath, pyProjectRootPath + "/possc.py", "-l", steelType_regression, stoveNum_regression, input_columns, outputSelect_regression};
        }
        String str = getOutput(cmds);
        model.addAttribute("text", str);
        return "test";
    }

    @RequestMapping("/clean")
    public String clean(HttpServletRequest request, Model model) throws Exception {
        String[] cmds;
        String steelType_clean = request.getParameter("steelType_clean");
        String stoveNum_clean = request.getParameter("stoveNum_clean");
        String code16_clean = request.getParameter("code16_clean");
        String flag = request.getParameter("clean_flag");
        if(flag!=null){
            cmds = new String[] {pyInterpreterPath, pyProjectRootPath + "/possc.py", "-n", steelType_clean, stoveNum_clean, code16_clean};
        }
        else{
            cmds = new String[] {pyInterpreterPath, pyProjectRootPath + "/possc.py", "-c", steelType_clean, stoveNum_clean};
        }
        String str = getOutput(cmds);
        model.addAttribute("text", str);
        return "test";
    }

    public static String convertArrayToString(String[] strArr) {
        if (strArr == null || strArr.length == 0) {
            return "";
        }
        String res = "";
        for (int i = 0, len = strArr.length; i < len; i++) {
            res += strArr[i];
            if (i < len - 1) {
                res += ",";
            }
        }
        return res;
    }

    public static String getOutput(String[] cmds) throws Exception
    {
        Process pcs = Runtime.getRuntime().exec(cmds);
        // 定义Python脚本的返回值
        String result = null;
        // 获取CMD的返回流
        BufferedInputStream in = new BufferedInputStream(pcs.getInputStream());
        // 字符流转换字节流
        BufferedReader br = new BufferedReader(new InputStreamReader(in, "GBK"));
        // 这里也可以输出文本日志

        String lineStr = null;
        String result1="";
        while ((lineStr = br.readLine()) != null) {
            result = lineStr;
            result1=result1.concat(result);
        }
        // 关闭输入流
        br.close();
        in.close();
        return result1;

    }
    public static <T> String listToString(List<T> list) {
        StringBuilder sb = new StringBuilder();
        boolean b = false;
        for (T o : list) {
            if (b)
                sb.append(',');
            sb.append(o);
            b = true;
        }
        return sb.toString();
    }

}
