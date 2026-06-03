<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>古建筑信息目录</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'system-ui', '-apple-system', 'Segoe UI', 'sans-serif'],
                    },
                }
            }
        }
    </script>
    <style>
        .glass-nav { backdrop-filter: blur(20px) saturate(180%); -webkit-backdrop-filter: blur(20px) saturate(180%); }
        .table-row { transition: background-color 0.15s ease; }
        .table-row:hover { background-color: #f8fafc; }
        .btn-transition { transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1); }
        .btn-transition:active { transform: scale(0.97); }
    </style>
</head>
<body class="bg-slate-50 min-h-screen">
    <nav class="fixed top-0 inset-x-0 z-50 bg-white/80 glass-nav border-b border-slate-200/60">
        <div class="max-w-7xl mx-auto px-6 h-14 flex items-center justify-between">
            <a href="${pageContext.request.contextPath}/index.jsp"
               class="inline-flex items-center text-sm font-medium text-slate-500 hover:text-slate-900 transition-colors">
                <svg class="w-4 h-4 mr-1.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 18-6-6 6-6"/></svg>
                返回首页
            </a>
            <span class="text-sm font-semibold text-slate-800">古建筑信息目录</span>
            <div class="w-20"></div>
        </div>
    </nav>

    <main class="pt-20 pb-16 px-6">
        <div class="max-w-7xl mx-auto">
            <!-- Active Buildings Table -->
            <div class="bg-white rounded-2xl border border-slate-200/60 shadow-sm overflow-hidden mb-12">
                <div class="px-6 py-5 border-b border-slate-100">
                    <h2 class="text-lg font-semibold text-slate-900">古建筑信息列表</h2>
                    <p class="text-sm text-slate-500 mt-0.5">正常数据</p>
                </div>
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead>
                            <tr class="bg-slate-50/80 text-left">
                                <th class="px-6 py-3.5 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">所属地区</th>
                                <th class="px-6 py-3.5 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">建筑名称</th>
                                <th class="px-6 py-3.5 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">建造年代</th>
                                <th class="px-6 py-3.5 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">保护等级</th>
                                <th class="px-6 py-3.5 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">建筑介绍</th>
                                <th class="px-6 py-3.5 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">操作</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            <c:if test="${empty pageBean.list}">
                                <tr><td colspan="6" class="px-6 py-16 text-center text-slate-400">暂无正常数据</td></tr>
                            </c:if>
                            <c:forEach items="${pageBean.list}" var="building">
                                <tr class="table-row">
                                    <td class="px-6 py-4 text-sm text-slate-700 whitespace-nowrap">${building.areaName}</td>
                                    <td class="px-6 py-4 text-sm font-medium text-slate-900 whitespace-nowrap">${building.buildingName}</td>
                                    <td class="px-6 py-4 text-sm text-slate-600 whitespace-nowrap">${building.buildYear == null ? "未知" : building.buildYear}</td>
                                    <td class="px-6 py-4 text-sm whitespace-nowrap">
                                        <c:choose>
                                            <c:when test="${building.protectionLevel == null || building.protectionLevel == ''}">
                                                <span class="text-slate-400">无等级</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-amber-50 text-amber-700 border border-amber-200/60">${building.protectionLevel}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="px-6 py-4 text-sm text-slate-600 max-w-xs truncate">${building.introduction == null ? "暂无介绍" : building.introduction}</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <a href="javascript:;" onclick="confirmDelete(${building.id})"
                                           class="btn-transition inline-flex items-center px-3 py-1.5 text-xs font-medium text-rose-600 bg-rose-50 hover:bg-rose-100 rounded-lg">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Pagination -->
            <div class="flex flex-wrap items-center justify-center gap-2 mb-16">
                <c:choose>
                    <c:when test="${pageBean.pageNum == 1}">
                        <span class="px-3 py-2 text-sm text-slate-300 bg-slate-100 rounded-lg cursor-not-allowed">首页</span>
                        <span class="px-3 py-2 text-sm text-slate-300 bg-slate-100 rounded-lg cursor-not-allowed">上一页</span>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/building/page?pageNum=1"
                           class="px-3 py-2 text-sm font-medium text-slate-600 bg-white border border-slate-200 hover:bg-slate-50 rounded-lg btn-transition">首页</a>
                        <a href="${pageContext.request.contextPath}/building/page?pageNum=${pageBean.pageNum - 1}"
                           class="px-3 py-2 text-sm font-medium text-slate-600 bg-white border border-slate-200 hover:bg-slate-50 rounded-lg btn-transition">上一页</a>
                    </c:otherwise>
                </c:choose>

                <span class="px-4 py-2 text-sm text-slate-600">
                    第 <span class="font-semibold text-slate-900">${pageBean.pageNum}</span> / <span class="font-semibold text-slate-900">${pageBean.pages}</span> 页
                    <span class="mx-2 text-slate-300">|</span>
                    共 <span class="font-semibold text-slate-900">${pageBean.total}</span> 条
                </span>

                <c:choose>
                    <c:when test="${pageBean.pageNum == pageBean.pages || pageBean.pages == 0}">
                        <span class="px-3 py-2 text-sm text-slate-300 bg-slate-100 rounded-lg cursor-not-allowed">下一页</span>
                        <span class="px-3 py-2 text-sm text-slate-300 bg-slate-100 rounded-lg cursor-not-allowed">尾页</span>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/building/page?pageNum=${pageBean.pageNum + 1}"
                           class="px-3 py-2 text-sm font-medium text-slate-600 bg-white border border-slate-200 hover:bg-slate-50 rounded-lg btn-transition">下一页</a>
                        <a href="${pageContext.request.contextPath}/building/page?pageNum=${pageBean.pages}"
                           class="px-3 py-2 text-sm font-medium text-slate-600 bg-white border border-slate-200 hover:bg-slate-50 rounded-lg btn-transition">尾页</a>
                    </c:otherwise>
                </c:choose>

                <span class="inline-flex items-center ml-3">
                    <input type="number" id="pageInput" min="1" max="${pageBean.pages}" placeholder="页码"
                           class="w-16 px-3 py-2 text-sm text-center border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400">
                    <button onclick="jumpPage()"
                            class="ml-2 px-4 py-2 text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 rounded-lg btn-transition">跳转</button>
                </span>
            </div>

            <!-- Deleted Buildings Section -->
            <c:if test="${isLastPage}">
                <div class="bg-white rounded-2xl border border-slate-200/60 shadow-sm overflow-hidden opacity-70">
                    <div class="px-6 py-5 border-b border-slate-100 bg-slate-50/50">
                        <h2 class="text-lg font-semibold text-slate-500">已删除数据</h2>
                        <p class="text-sm text-slate-400 mt-0.5">可恢复</p>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="w-full">
                            <thead>
                                <tr class="bg-slate-50/50 text-left">
                                    <th class="px-6 py-3 text-xs font-medium text-slate-400 uppercase tracking-wider whitespace-nowrap">所属地区</th>
                                    <th class="px-6 py-3 text-xs font-medium text-slate-400 uppercase tracking-wider whitespace-nowrap">建筑名称</th>
                                    <th class="px-6 py-3 text-xs font-medium text-slate-400 uppercase tracking-wider whitespace-nowrap">建造年代</th>
                                    <th class="px-6 py-3 text-xs font-medium text-slate-400 uppercase tracking-wider whitespace-nowrap">保护等级</th>
                                    <th class="px-6 py-3 text-xs font-medium text-slate-400 uppercase tracking-wider whitespace-nowrap">建筑介绍</th>
                                    <th class="px-6 py-3 text-xs font-medium text-slate-400 uppercase tracking-wider whitespace-nowrap">操作</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-slate-50">
                                <c:if test="${empty deletedList}">
                                    <tr><td colspan="6" class="px-6 py-12 text-center text-slate-300">暂无已删除数据</td></tr>
                                </c:if>
                                <c:forEach items="${deletedList}" var="building">
                                    <tr class="table-row">
                                        <td class="px-6 py-3.5 text-sm text-slate-400 whitespace-nowrap">${building.areaName}</td>
                                        <td class="px-6 py-3.5 text-sm text-slate-400 whitespace-nowrap">${building.buildingName}</td>
                                        <td class="px-6 py-3.5 text-sm text-slate-400 whitespace-nowrap">${building.buildYear == null ? "未知" : building.buildYear}</td>
                                        <td class="px-6 py-3.5 text-sm text-slate-400 whitespace-nowrap">${building.protectionLevel == null ? "无等级" : building.protectionLevel}</td>
                                        <td class="px-6 py-3.5 text-sm text-slate-400 max-w-xs truncate">${building.introduction == null ? "暂无介绍" : building.introduction}</td>
                                        <td class="px-6 py-3.5 whitespace-nowrap">
                                            <a href="javascript:;" onclick="confirmRestore(${building.id})"
                                               class="btn-transition inline-flex items-center px-3 py-1.5 text-xs font-medium text-emerald-600 bg-emerald-50 hover:bg-emerald-100 rounded-lg">恢复</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </c:if>
        </div>
    </main>

    <script>
        function jumpPage() {
            let pageNum = document.getElementById("pageInput").value;
            let totalPages = ${pageBean.pages};
            if (!pageNum || pageNum < 1 || pageNum > totalPages) {
                alert("请输入 1\uFF5E" + totalPages + " 之间的页码");
                return;
            }
            window.location.href = "${pageContext.request.contextPath}/building/page?pageNum=" + pageNum;
        }
        function confirmDelete(buildingId) {
            if (confirm("确定要删除该古建筑信息吗？")) {
                window.location.href = "${pageContext.request.contextPath}/building/delete?id=" + buildingId;
            }
        }
        function confirmRestore(buildingId) {
            if (confirm("确定要恢复该古建筑信息吗？")) {
                window.location.href = "${pageContext.request.contextPath}/building/restore?id=" + buildingId;
            }
        }
    </script>
</body>
</html>