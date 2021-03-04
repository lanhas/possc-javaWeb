<%@ page import="java.io.File" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        html{
            font-size: 17px;
        }
        form{
            border: 2px solid grey;
            padding: 10px;
            margin-bottom: 20px;
        }

        form select{
            height: 25px;
            font-weight: 700;
            font-size: 16px;
        }
        .form1{
            height: 580px;
            width: 1560px;
        }
        .form2{
            height: 600px;
            width: 1560px;
        }
        .form3{
            height: 620px;
            width: 1560px;
        }
        .btn1{
            margin-top: 8px;
            width: 140px;
            height: 50px;
            font-size: 20px;
            font-weight: 700;
        }
        .btn2{
            margin-top: 8px;
            width: 200px;
            height: 50px;
            font-size: 20px;
            font-weight: 700;
        }
        .btn3{
            margin-top: 8px;
            width: 180px;
            height: 50px;
            font-size: 20px;
            font-weight: 700;
        }
        .input{
            height: 30px;
            width: 260px;
            float: left;
        }
        .input_checked{
            height: 50px;
            width: 260px;
            float: left;
        }
        #outputSelect_regression{
            height: 25px;
            font-weight: 700;
            font-size: 16px;
        }
        textarea{

            border: 2px solid grey;
        }
    </style>
</head>
<body>
<div>
    <div>
        <h2>机器学习预测：</h2>
        <form action="/train" method="post" class="form1" >
            训练参数：
            钢种类型
            <select id="steelType_train" name="steelType_train">
                <option value="Q235B-Z">Q235B-Z</option>
                <option value="Q195L">Q195L</option>
                <option value="Q195-Y">Q195-Y</option>
                <option value="HRB400E">HRB400E</option>
            </select>

            炉号
            <select id="stoveNum_train" name="stoveNum_train">
                <option value="1">1号炉</option>
                <option value="2">2号炉</option>
            </select><br/>
            <tr>
                <td class="label">影响因素：</td><br/>
                <td class="controler">
                    <td class="label">原料参数：</td><br/>
                    <div class="input"><input type="checkbox" name="input_train" value="ingredient_C" checked="checked"> 碳含量（铁水成分）% &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="ingredient_Si" checked="checked"> 硅含量（铁水成分）% &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="ingredient_Mn" checked="checked"> 锰含量（铁水成分）% &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="ingredient_P" checked="checked"> 磷含量（铁水成分）% &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="ingredient_S" checked="checked"> 硫含量（铁水成分）% &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="feLiquid_temp" checked="checked"> 铁水温度（℃） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="fe_caliber"> 出钢口龄 &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="feLiquid_enclose" checked="checked"> 铁水 &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="feScrapped_enclose" checked="checked"> 废钢 &nbsp;</div>
<%--                    <div class="input"><input type="checkbox" name="input_train" value="feScrapped_enclose_inner"> 自产 &nbsp;</div>--%>
                    <div class="input"><input type="checkbox" name="input_train" value="feLqCons_enclose" checked="checked"> 铁水消耗 &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="feRawCons_enclose" checked="checked"> 钢铁料消耗 &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="sum_enclose" > 合计 &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="steelLiquid" checked="checked"> 钢水量 &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="take_probality"> 收得率 &nbsp</div><br/>
                    <div class="input"></div>
<%--                    <div class="input"></div>--%>
                    <div class="input"></div>
                    <div class="input"></div>
                    <div class="input"></div>
                    <td class="label">过程参数：</td><br/>
                    <div class="input"><input type="checkbox" name="input_train" value="oxygenSupply_time" checked="checked"> 供氧时长 &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="oxygen_consume" checked="checked"> 耗氧量 &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="stove_pull" > 倒炉次数 &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="lime_append" checked="checked"> 石灰加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="limestone_append" checked="checked"> 石灰石加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="dolomite_append" checked="checked"> 生白云石加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="mineral_append" checked="checked"> 矿石加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="qingshao_append" checked="checked"> 轻烧加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="Mg_append" > 镁球加入量（kg）&nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="steelLiq_pullTemp1" checked="checked"> 一倒温度（℃） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="steelLiq_addTime"> 补吹时间（分、秒） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="steelLiq_outTemp" > 出钢温度（℃） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="nitrogen_consume" > 耗氮量（N㎡） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="nitrogen_time" checked="checked"> 溅渣用时（分、秒） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="slag_modifier"> 调渣剂（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="alloy_SiFe"> 硅铁加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="alloy_SiMn" > 硅锰加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="alloy_VN"> 钒氮合金加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="alloy_SiAlFe" > 钢砂铝加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="alloy_MnFe_hC" > 高碳锰铁（加入量） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="alloy_SiAlCa"> 硅铝钙加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="alloy_MnFe_mC"> 中碳锰铁加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="alloy_TiFe"> 钛铁加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="alloy_NbFe"> 鈮铁加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="alloy_Al"> 铝粉加入量（kg） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="input_train" value="alloy_carburant" > 增碳剂加入量（kg） &nbsp;</div>
<%--                    <div class="input"><input type="checkbox" name="input_train" value="steelLiquid_oxygen"> 刚包内钢水氧 &nbsp;</div>--%>
<%--                    <div class="input"><input type="checkbox" name="input_train" value="steelLiquid_dierction" > 钢水去向 &nbsp;</div>--%>

                    <!-- 下面7个带input类的div是用作占位的 -->
                    <div class="input"></div>
                    <div class="input"></div>
                    <div class="input"></div>
                    <div class="input"></div>
<%--                    <div class="input"></div>--%>
                    <!-- 上面7个带input类的div是用作占位的 -->

                </td>
            </tr>
            <tr>
                <td class="label">终点成分：</td><br/>
                <td class="controler">
                    <div class="input"><input type="checkbox" name="output_train" value="terminal_C" checked="checked"> 碳含量（终点成分） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="output_train" value="terminal_S" checked="checked"> 硫含量（终点成分） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="output_train" value="terminal_P" checked="checked"> 磷含量（终点成分） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="output_train" value="terminal_Mn" checked="checked"> 锰含量（终点成分） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="output_train" value="steelLiq_pullTemp1" > 一倒温度（℃） &nbsp</div>
                    <div class="input"></div>
                <td class="label">成品成分：</td><br/>
                    <div class="input"><input type="checkbox" name="output_train" value="product_C" > 碳含量（成品成分） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="output_train" value="product_Si" > 硅含量（成品成分） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="output_train" value="product_Mn" > 锰含量（成品成分） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="output_train" value="product_P" > 磷含量（成品成分） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="output_train" value="product_S" > 硫含量（成品成分） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="output_train" value="product_PaddS" > P+S之和（成品成分） &nbsp;</div>
                    <div class="input"><input type="checkbox" name="output_train" value="product_Als" > Als酸溶铝含量（成品成分）</div>
                    <div class="input"></div>
                    <div class="input"></div>
                    <div class="input"></div>
                    <div class="input"></div>
                    <div class="input"></div>
                </td>
            </tr>
            <input type="submit" value="点击训练" class="btn1"/>
        </form>


        <form action="/test" method="post" class="form3" >
            预测参数：
            钢种类型
            <select id="steelType_test" name="steelType_test">
                <option value="Q235B-Z">Q235B-Z</option>
                <option value="Q195L">Q195L</option>
                <option value="Q195-Y">Q195-Y</option>
                <option value="HRB400E">HRB400E</option>
            </select>
            炉号
            <select id="stoveNum_test" name="stoveNum_test">
                <option value="1">1号炉</option>
                <option value="2">2号炉</option>
            </select>

            模型选择：
<%--            <select id="modelSelect_test" name="modelSelect_test">--%>
<%--            </select><br/>--%>
<%--            </select><br/>--%>
            <input type="text" name="modelSelect_test" >
            <tr>
                <input type="checkbox" name="test_flag" value="forecast" checked="checked"> 预测/测试 &nbsp;<br>
                <td class="controler">
                <td class="label">影响因素：</td><br/>
                <td class="label">原料参数：</td><br/>
                <div class="input_checked"><input type="checkbox" name="input_test" value="ingredient_C" checked="checked">碳含量（铁水成分）%:<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="ingredient_Si" checked="checked">硅含量（铁水成分）%:<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="ingredient_Mn" checked="checked">锰含量（铁水成分）%:<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="ingredient_P" checked="checked">磷含量（铁水成分）%:<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="ingredient_S" checked="checked">硫含量（铁水成分）%:<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="feLiquid_temp" checked="checked"> 铁水温度（℃）:<input type="text" name="textedit_test" >  &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="fe_caliber" > 出钢口龄 :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="feLiquid_enclose" checked="checked"> 铁水 :&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="feScrapped_enclose" checked="checked"> 废钢 :&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="textedit_test" > &nbsp;</div>
<%--                <div class="input_checked"><input type="checkbox" name="input_test" value="feScrapped_enclose_inner"> 自产 :<input type="text" name="textedit_test" > &nbsp;</div>--%>
                <div class="input_checked"><input type="checkbox" name="input_test" value="feLqCons_enclose" checked="checked"> 铁水消耗 :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="feRawCons_enclose" checked="checked"> 钢铁料消耗 :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="sum_enclose" > 合计 :&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="steelLiquid" checked="checked"> 钢水量 :&nbsp&nbsp&nbsp&nbsp<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="take_probality"> 收得率 :&nbsp&nbsp&nbsp&nbsp<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"></div>
                <div class="input_checked"></div>
                <div class="input_checked"></div>
                <div class="input_checked"></div>
                <td class="label">过程参数：</td><br/>
                <div class="input_checked"><input type="checkbox" name="input_test" value="oxygenSupply_time" checked="checked"> 供氧时长 :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="oxygen_consume" checked="checked"> 耗氧量 :&nbsp&nbsp&nbsp&nbsp<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="stove_pull" > 倒炉次数 :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="lime_append" checked="checked"> 石灰加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="limestone_append" checked="checked"> 石灰石加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="dolomite_append" checked="checked"> 生白云石加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="mineral_append" checked="checked"> 矿石加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="qingshao_append" checked="checked"> 轻烧加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="Mg_append"> 镁球加入量（kg）:<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="steelLiq_pullTemp1" checked="checked"> 一倒温度（℃） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="steelLiq_addTime"> 补吹时间（分、秒） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="steelLiq_outTemp" > 出钢温度（℃） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="nitrogen_consume" > 耗氮量（N㎡） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="nitrogen_time" checked="checked"> 溅渣用时（分、秒） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="slag_modifier"> 调渣剂（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="alloy_SiFe"> 硅铁加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="alloy_SiMn" > 硅锰加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="alloy_VN"> 钒氮合金加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="alloy_SiAlFe" > 钢砂铝加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="alloy_MnFe_hC" > 高碳锰铁（加入量） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="alloy_SiAlCa"> 硅铝钙加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="alloy_MnFe_mC"> 中碳锰铁加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="alloy_TiFe"> 钛铁加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="alloy_NbFe"> 鈮铁加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="alloy_Al"> 铝粉加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
                <div class="input_checked"><input type="checkbox" name="input_test" value="alloy_carburant" > 增碳剂加入量（kg） :<input type="text" name="textedit_test" > &nbsp;</div>
<%--                <div class="input_checked"><input type="checkbox" name="input_test" value="terminal_C"> 碳含量（终点成分） :<input type="text" name="textedit_test" > &nbsp;</div>--%>
<%--                <div class="input_checked"><input type="checkbox" name="input_test" value="terminal_S"> 硫含量（终点成分） :<input type="text" name="textedit_test" > &nbsp;</div>--%>
<%--                <div class="input_checked"><input type="checkbox" name="input_test" value="terminal_P"> 磷含量（终点成分） :<input type="text" name="textedit_test" > &nbsp;</div>--%>
<%--                <div class="input_checked"><input type="checkbox" name="input_test" value="terminal_Mn"> 锰含量（终点成分） :<input type="text" name="textedit_test" > &nbsp;</div>--%>
<%--                <div class="input_checked"><input type="checkbox" name="input_test" value="steelLiquid_oxygen"> 刚包内钢水氧 :<input type="text" name="textedit_test" > &nbsp;</div>--%>
<%--                <div class="input_checked"><input type="checkbox" name="input_test" value="steelLiquid_dierction" > 钢水去向 :<input type="text" name="textedit_test" > &nbsp;</div>--%>

                <!-- 下面7个带input类的div是用作占位的 -->
                <div class="input_checked"></div>
                <div class="input_checked"></div>
                <div class="input_checked"></div>
                <div class="input_checked"></div>
                </td>
            </tr>
            <input type="submit" value="机器学习预测" class="btn2"/>
        </form>
        <h2>线性回归预测：</h2>
        <form action="/regression" method="post" class="form2" >
            钢种类型
            <select id="steelType_regression" name="steelType_regression">
                <option value="Q235B-Z">Q235B-Z</option>
                <option value="Q195L">Q195L</option>
                <option value="Q195-Y">Q195-Y</option>
                <option value="HRB400E">HRB400E</option>
            </select>
            炉号
            <select id="stoveNum_regression" name="stoveNum_regression">
                <option value="1">1号炉</option>
                <option value="2">2号炉</option>
            </select>
            <tr>
                <input type="checkbox" name="regression_flag" value="forecast" checked="checked"> 预测/测试 &nbsp;<br>
                <td class="controler">
                <td class="label">影响因素：</td><br/>
                <td class="label">原料参数：</td><br/>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="ingredient_C" checked="checked">碳含量（铁水成分）%:<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="ingredient_Si" checked="checked">硅含量（铁水成分）%:<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="ingredient_Mn" checked="checked">锰含量（铁水成分）%:<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="ingredient_P" checked="checked">磷含量（铁水成分）%:<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="ingredient_S" checked="checked">硫含量（铁水成分）%:<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="feLiquid_temp" checked="checked"> 铁水温度（℃）:<input type="text" name="textedit_regression" >  &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="fe_caliber" > 出钢口龄 :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="feLiquid_enclose" checked="checked"> 铁水 :&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="feScrapped_enclose" checked="checked"> 废钢 :&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="textedit_regression" > &nbsp;</div>
<%--                    <div class="input_checked"><input type="checkbox" name="input_regression" value="feScrapped_enclose_inner"> 自产 :<input type="text" name="textedit_regression" > &nbsp;</div>--%>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="feLqCons_enclose" checked="checked"> 铁水消耗 :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="feRawCons_enclose" checked="checked"> 钢铁料消耗 :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="sum_enclose" > 合计 :&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="steelLiquid" checked="checked"> 钢水量 :&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="take_probality"> 收得率 :&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="oxygenSupply_time" checked="checked"> 供氧时长 :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <!-- 下面7个带input类的div是用作占位的 -->
                    <div class="input_checked"></div>
                    <div class="input_checked"></div>
                    <div class="input_checked"></div>
                    <!-- 上面7个带input类的div是用作占位的 -->
                <td class="label">过程参数：</td><br/>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="oxygen_consume" checked="checked"> 耗氧量 :&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="stove_pull" > 倒炉次数 :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="lime_append" checked="checked"> 石灰加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="limestone_append" checked="checked"> 石灰石加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="dolomite_append" checked="checked"> 生白云石加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="mineral_append" checked="checked"> 矿石加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="qingshao_append" checked="checked"> 轻烧加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="Mg_append"> 镁球加入量（kg）:<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="steelLiq_pullTemp1" checked="checked"> 一倒温度（℃） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="steelLiq_addTime"> 补吹时间（分、秒） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="steelLiq_outTemp" > 出钢温度（℃） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="nitrogen_consume" > 耗氮量（N㎡） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="nitrogen_time" checked="checked"> 溅渣用时（分、秒） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="slag_modifier"> 调渣剂（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="alloy_SiFe"> 硅铁加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="alloy_SiMn" > 硅锰加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="alloy_VN"> 钒氮合金加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="alloy_SiAlFe" > 钢砂铝加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="alloy_MnFe_hC" > 高碳锰铁（加入量） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="alloy_SiAlCa"> 硅铝钙加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="alloy_MnFe_mC"> 中碳锰铁加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="alloy_TiFe"> 钛铁加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="alloy_NbFe"> 鈮铁加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="alloy_Al"> 铝粉加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
                    <div class="input_checked"><input type="checkbox" name="input_regression" value="alloy_carburant" > 增碳剂加入量（kg） :<input type="text" name="textedit_regression" > &nbsp;</div>
<%--                    <div class="input_checked"><input type="checkbox" name="input_regression" value="terminal_C"> 碳含量（终点成分） :<input type="text" name="textedit_regression" > &nbsp;</div>--%>
<%--                    <div class="input_checked"><input type="checkbox" name="input_regression" value="terminal_S"> 硫含量（终点成分） :<input type="text" name="textedit_regression" > &nbsp;</div>--%>
<%--                    <div class="input_checked"><input type="checkbox" name="input_regression" value="terminal_P"> 磷含量（终点成分） :<input type="text" name="textedit_regression" > &nbsp;</div>--%>
<%--                    <div class="input_checked"><input type="checkbox" name="input_regression" value="terminal_Mn"> 锰含量（终点成分） :<input type="text" name="textedit_regression" > &nbsp;</div>--%>
<%--                    <div class="input_checked"><input type="checkbox" name="input_regression" value="steelLiquid_oxygen"> 刚包内钢水氧 :<input type="text" name="textedit_regression" > &nbsp;</div>--%>
<%--                    <div class="input_checked"><input type="checkbox" name="input_regression" value="steelLiquid_dierction" > 钢水去向 :<input type="text" name="textedit_regression" > &nbsp;</div>--%>

                    <!-- 下面7个带input类的div是用作占位的 -->
                    <div class="input_checked"></div>
                    <div class="input_checked"></div>
                    <div class="input_checked"></div>
                    <div class="input_checked"></div>
                    <div class="input_checked"></div>
                    <!-- 上面7个带input类的div是用作占位的 -->

                </td>
            </tr>
            <td class="label">终点成分：</td><br/>
            <select id="outputSelect_regression" name="outputSelect_regression" style="height:30px;width:180px;">
            <option value="terminal_C">碳含量（终点成分）</option>
            <option value="terminal_S">硫含量（终点成分）</option>
            <option value="terminal_P">磷含量（终点成分）</option>
            <option value="terminal_Mn">锰含量（终点成分）</option>
            <option value="steelLiq_pullTemp1">一倒温度</option>
<%--            <option value="product_PaddS">磷硫和（P+S）</option>--%>
<%--            <option value="product_Als">酸溶铝（Als）</option>--%>
        </select><br/>
            <input type="submit" value="线性回归测试/预测" class="btn3"/>
        </form>

        <form action="/clean" method="post" >
            文件清理：
            钢种类型
            <select id="steelType_clean" name="steelType_clean">
                <option value="Q235B-Z">Q235B-Z</option>
                <option value="Q195L">Q195L</option>
                <option value="Q195-Y">Q195-Y</option>
                <option value="HRB400E">HRB400E</option>
            </select>
            炉号
            <select id="stoveNum_clean" name="stoveNum_clean">
                <option value="1">1号炉</option>
                <option value="2">2号炉</option>
            </select>
            编码
            <input type="text" name="code16_clean" style="height:18px;width:60px;">
            <input type="checkbox" name="clean_flag" value="forecast" checked="checked" > 按编码删除/删除全部 &nbsp;<br>
            <br/>
            <input type="submit" value="清理" style="height:20px;width:200px;"/>
        </form>

    </div>
    <div>
        <textarea style="width: 600px; height: 600px">${text}</textarea>
    </div>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function(){
        let steelType = $("#steelType_test").val()
        let stoveNum = $("#stoveNum_test").val()
        let transdata={
            "steelType":steelType,
            "stoveNum":stoveNum

        }
        $.ajax({
            type : "post",
            async : false, //同步执行
            url : "getModel.do",
            data : transdata,
            //dataType : "json", //返回数据形式为json
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            //contentType: "application/json;charset=utf-8",
            success : function(result) {
                for (let index = 0; index < result.length; index++) {
                    $("#modelSelect_test").append("<option value='"+result[index]+"'>"+result[index]+"</option>");
                }
            },
            error : function(errorMsg) {
                alert("不好意思，数据请求数据失败啦!");
            }
        })
    })
</script>


</html>


