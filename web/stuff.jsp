<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.user!=null}">
                <div id="setting" class="setting-cover closesetting">
                    <div class="setting non-animated" id="animatesetting">
                        <i id="exitsetting" class="bx bx-x"></i>
                        <div class="setting-profile">
                            <strong>${sessionScope.user.fullname}</strong>
                            <small>${sessionScope.user.email}</small>
                        </div>
                        <div class="setting-nav">
                            <a href="profileSetting.jsp">
                                <i class="bx bxs-user-detail"></i>
                                <span href="">Profile</span>
                            </a>
                            <a href="security.jsp">
                                <i class="bx bxs-shield"></i>
                                <span href="">Security</span>
                            </a>
                            <a href="userDashboard">
                                <i class="bx bxs-bar-chart-alt-2"></i>
                                <span href="userDashboard">Admin dashboard</span>
                            </a>
                            <a href="#">
                                <i class="bx bxs-moon"></i>
                                <span href="">Dark mode</span>
                            </a>
                        </div>
                        <div class="logout">
                            <a href="logout">
                                <i class="bx bxs-log-out-circle"></i>
                                <span>Logout</span>
                            </a>
                        </div>
                    </div>
                </div>
            </c:if>