<%-- 
    Document   : newjsp
    Created on : Jul 8, 2024, 10:17:13 AM
    Author     : admin
--%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/global/base.css" type="text/css">
        <link rel="stylesheet" href="css/dashboard/productdashboard.css" type="text/css">
        <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
        <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Fira+Code:wght@300..700&display=swap" rel="stylesheet" />
        <style>
            /* Add some basic styling to make it look better */
            body {
                font-family: 'Fira Code', monospace;
                background-color: #f9f9f9;
            }
            .edit-modal {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                background-color: #fff;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            .edit-modal-header {
                margin-bottom: 20px;
            }
            .edit-modal-header strong {
                font-size: 18px;
                margin-right: 10px;
            }
            .edit-modal-header span {
                font-size: 14px;
                color: #666;
            }
            .input-item {
                margin-bottom: 20px;
            }
            .input-item label {
                display: block;
                margin-bottom: 10px;
            }
            .input-item input,.input-item textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .input-item textarea {
                height: 100px;
            }
            .buttons {
                text-align: right;
            }
            .buttons.close-edit {
                margin-right: 20px;
                color: #666;
                cursor: pointer;
            }
            .buttons button[type="submit"] {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .buttons button[type="submit"]:hover {
                background-color: #3e8e41;
            }
            .edit-modal select option {
                color: #666; /* or any other color you prefer */
            }
        </style>
    </head>
    <body>
        <div class="edit-modal">
            <div class="edit-modal-header">
                <strong>Edit Product</strong>
                <span>Form to edit product here.</span>
            </div>
            <form action="submitEdit" method="post" autocomplete="off" spellcheck="false" class="edit-form" name="editForm">
                <div class="input-item">
                    <label for="productname">Product name</label>
                    
                    <input type="text" name="productName" placeholder="${sessionScope.currentItem.productName}" value="${sessionScope.currentItem.productName.trim()}"/>
                </div>
                <div class="input-item">
                    <label for="image">Product image (URLs)</label>
                    <input type="text" name="productImg" placeholder="${sessionScope.currentItem.productImg}" value="${sessionScope.currentItem.productImg.trim()}"/>
                </div>
                <div class="input-item">
                    <label for="price">Product price</label>
                    <input type="text" name="price" value="${sessionScope.currentItem.prices}" />
                </div>
                <div class="input-item">
                    <label for="description">Description</label>
                    <textarea name="productDes" id="" placeholder="${sessionScope.currentItem.productDes.trim()}" ></textarea>
                    
                </div>
                <div class="input-item">
                    <label for="category">Category</label>
                    <select name="category" id="">
                        <option value="">Select category</option>
                        <c:forEach items="${sessionScope.listCate}" var="c">
                            <option value="${c.productCategory}">${c.productCategory}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="buttons">
                    <span class="close-edit">Cancel</span>
                    <button type="submit">Update</button>
                </div>
            </form>
    </body>      
</html>