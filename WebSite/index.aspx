<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="script/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <div class="container">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">人物</div>
            </div>
            <div class="panel-body">
                <form id="form1" runat="server" style="margin: 10px">
                    <div class="form-group form-group-sm has-success">
                        <label>名字</label>
                        <input type="text" class="form-control " runat="server" id="txtAuthorName" />
                    </div>
                    <div class="form-group form-group-sm has-success">
                        <label>代表作</label>
                        <input type="text" class="form-control" runat="server" id="txtOpus" />
                    </div>
                    <div class="form-group form-group-sm has-success">
                        <label>生日</label>
                        <input type="text" class="form-control" runat="server" id="txtBirthday" />
                    </div>
                    <div class="form-group form-group-sm has-success">
                        <label>出生地</label>
                        <input type="text" class="form-control" runat="server" id="txtHomeTown" />
                    </div>
                    <div class="form-group form-group-sm has-success">
                        <label>性别</label>
                        <asp:DropDownList class="form-control" runat="server" ID="selectSex">
                            <asp:ListItem Value="1">男</asp:ListItem>
                            <asp:ListItem Value="0">女</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group form-group-sm has-success">
                        <label>职业</label>
                        <input type="text" class="form-control" runat="server" id="txtWork" />
                    </div>
                    <div class="form-group form-group-sm has-success">
                        <label>百科URL</label>
                        <div class="input-group">
                            <span class="input-group-addon">http://</span>
                            <input type="text" class="form-control" runat="server" id="txtBaikeUrl" />
                        </div>
                    </div>
                    <div class="form-group form-group-sm has-success has-success">
                        <label>搭档</label>
                        <input type="text" class="form-control" runat="server" id="txtFrid" />
                    </div>
                    <div class="form-group  has-success">
                        <label>描述</label>
                        <textarea class="form-control" runat="server" id="txtDesc" rows="10" />
                    </div>
                    <div class="form-group  has-success">
                        <input type="submit" id="btnSubmit" runat="server" onserverclick="btnSubmit_ServerClick" class="btn btn-danger btn-lg" value="保存" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
