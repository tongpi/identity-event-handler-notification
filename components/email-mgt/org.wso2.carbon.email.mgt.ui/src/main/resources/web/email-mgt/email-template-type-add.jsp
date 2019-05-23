<%--
  ~ Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~ http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://wso2.org/projects/carbon/taglibs/carbontags.jar" prefix="carbon" %>
<jsp:include page="../dialog/display_messages.jsp"/>

<script type="text/javascript" src="../identity/validation/js/identity-validate.js"></script>


<fmt:bundle basename="org.wso2.carbon.email.mgt.ui.i18n.Resources">
    <carbon:breadcrumb label="challenge.add"
                       resourceBundle="org.wso2.carbon.email.ui.i18n.Resources"
                       topPage="true" request="<%=request%>"/>

    <script type="text/javascript">

        function addTemplateType() {
            var typeDisplayName = document.getElementsByName("templateDisplayName")[0].value;
            if (typeDisplayName == null || typeDisplayName == "") {
                CARBON.showWarningDialog('请指定一个有效的安全问题', null, null);
                location.href = '#';
            } else if (typeDisplayName.length > 50) {
                CARBON.showWarningDialog('<fmt:message key="email.template.type.is.too.long"/>');
                return false;
            }

            else {
                if (!doValidateInput(document.getElementById("templateDisplayName"), "Email 模板类别名称无效. 只有 {1} 被允许.")) {
                    location.href = '#';
                } else {
                    $("#templateTypeForm").submit();
                    return true;
                }
            }
        }

        function cancelForm() {
            location.href = 'email-template-mgt.jsp';
        }

    </script>

    <div id="middle">
        <h2><fmt:message key="email.template.type"/></h2>

        <form id="templateTypeForm" name="templateTypeForm" method="post"
              action="email-template-type-add-finish-ajaxprocessor.jsp">
            <div id="workArea">
                <table class="styledLeft">
                    <thead>
                    <tr>
                        <th colspan="2"><fmt:message key='email.template.type.add'/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="formRow">
                            <table class="normal" cellspacing="0">
                                <tr>
                                    <td class="leftCol-med labelField">
                                        <fmt:message key="email.template.type.display.templateType"/>
                                        <span class="required">*</span>
                                    </td>
                                    <td class="leftCol-big">
                                        <input size="50" name="templateDisplayName" id="templateDisplayName"
                                               class="text-box-big"
                                               white-list-patterns="^[a-zA-Z0-9\s]+$"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="buttonRow">
                                        <button onclick="addTemplateType()" type="button" class="button">添加</button>
                                        <button onclick="cancelForm()" type="button" class="button">取消</button>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</fmt:bundle>
