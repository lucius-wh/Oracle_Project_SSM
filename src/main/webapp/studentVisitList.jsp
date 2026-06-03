<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生参观古建筑记录</title>
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
        .search-panel { backdrop-filter: blur(12px); -webkit-backdrop-filter: blur(12px); }
    </style>
</head>
<body class="bg-slate-50 min-h-screen">
    <nav class="fixed top-0 inset-x-0 z-50 bg-white/80 glass-nav border-b border-slate-200/60">
        <div class="max-w-7xl mx-auto px-6 h-14 flex items-center justify-between">
            <div class="flex items-center gap-4">
                <a href="${pageContext.request.contextPath}/index.jsp" class="inline-flex items-center text-sm font-medium text-slate-500 hover:text-slate-900 transition-colors">
                    <svg class="w-4 h-4 mr-1.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 18-6-6 6-6"/></svg>返回首页</a>
                <button onclick="goAddRel()" class="btn-transition inline-flex items-center px-3 py-1.5 text-xs font-medium text-white bg-indigo-600 hover:bg-indigo-700 rounded-lg">
                    <svg class="w-3.5 h-3.5 mr-1" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 5v14"/><path d="M5 12h14"/></svg>添加记录</button>
            </div>
            <span class="text-sm font-semibold text-slate-800">参观记录管理</span>
            <div class="w-20"></div>
        </div>
    </nav>

    <main class="pt-20 pb-16 px-6">
        <div class="max-w-7xl mx-auto">
            <div class="bg-white/70 search-panel rounded-2xl border border-slate-200/60 shadow-sm p-5 mb-8">
                <form method="get" action="${pageContext.request.contextPath}/visit/list" class="flex flex-wrap gap-3 items-end">
                    <div class="flex-1 min-w-[180px]">
                        <label class="block text-xs font-medium text-slate-500 mb-1">关键词</label>
                        <input type="text" name="keyword" placeholder="学生姓名或建筑名称" value="${param.keyword}" class="w-full px-3 py-2 text-sm border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400">
                    </div>
                    <div class="w-[140px]">
                        <label class="block text-xs font-medium text-slate-500 mb-1">专业</label>
                        <select name="classname" class="w-full px-3 py-2 text-sm border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 bg-white">
                            <option value="">全部专业</option>
                            <option value="软工" ${param.classname=='软工'?'selected':''}>软工</option>
                            <option value="计科" ${param.classname=='计科'?'selected':''}>计科</option>
                            <option value="电建" ${param.classname=='电建'?'selected':''}>电建</option>
                            <option value="土木" ${param.classname=='土木'?'selected':''}>土木</option>
                            <option value="数学" ${param.classname=='数学'?'selected':''}>数学</option>
                            <option value="经管" ${param.classname=='经管'?'selected':''}>经管</option>
                            <option value="网安" ${param.classname=='网安'?'selected':''}>网安</option>
                        </select>
                    </div>
                    <div class="w-[140px]">
                        <label class="block text-xs font-medium text-slate-500 mb-1">城市</label>
                        <select name="areaCode" class="w-full px-3 py-2 text-sm border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 bg-white">
                            <option value="">全部城市</option>
                            <option value="1401%" ${param.areaCode=='1401%'?'selected':''}>太原市</option>
                            <option value="1402%" ${param.areaCode=='1402%'?'selected':''}>大同市</option>
                            <option value="1403%" ${param.areaCode=='1403%'?'selected':''}>阳泉市</option>
                            <option value="1404%" ${param.areaCode=='1404%'?'selected':''}>长治市</option>
                            <option value="1405%" ${param.areaCode=='1405%'?'selected':''}>晋城市</option>
                            <option value="1406%" ${param.areaCode=='1406%'?'selected':''}>朔州市</option>
                            <option value="1407%" ${param.areaCode=='1407%'?'selected':''}>晋中市</option>
                            <option value="1408%" ${param.areaCode=='1408%'?'selected':''}>运城市</option>
                            <option value="1409%" ${param.areaCode=='1409%'?'selected':''}>忻州市</option>
                            <option value="1410%" ${param.areaCode=='1410%'?'selected':''}>临汾市</option>
                            <option value="1411%" ${param.areaCode=='1411%'?'selected':''}>吕梁市</option>
                        </select>
                    </div>
                    <div class="w-[160px]">
                        <label class="block text-xs font-medium text-slate-500 mb-1">参观日期</label>
                        <input type="date" name="visitTime" value="${param.visitTime}" class="w-full px-3 py-2 text-sm border border-slate-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400">
                    </div>
                    <div class="flex gap-2">
                        <button type="submit" class="btn-transition px-4 py-2 text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 rounded-lg">查询</button>
                        <button type="button" onclick="resetSearch()" class="btn-transition px-4 py-2 text-sm font-medium text-slate-600 bg-white border border-slate-200 hover:bg-slate-50 rounded-lg">清空</button>
                    </div>
                </form>
            </div>

            <div class="bg-white rounded-2xl border border-slate-200/60 shadow-sm overflow-hidden">
                <div class="px-6 py-4 border-b border-slate-100">
                    <h2 class="text-lg font-semibold text-slate-900">参观记录列表</h2>
                    <p class="text-sm text-slate-500 mt-0.5">共 ${visitList.size()} 条记录</p>
                </div>
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead>
                            <tr class="bg-slate-50/80 text-left">
                                <th class="px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">记录ID</th>
                                <th class="px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">学生ID</th>
                                <th class="px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">学生姓名</th>
                                <th class="px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">专业</th>
                                <th class="px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">建筑ID</th>
                                <th class="px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">建筑名称</th>
                                <th class="px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">参观时间</th>
                                <th class="px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">评分</th>
                                <th class="px-4 py-3 text-xs font-semibold text-slate-500 uppercase tracking-wider whitespace-nowrap">操作</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-slate-100">
                            <c:forEach items="${visitList}" var="visit">
                                <tr class="table-row">
                                    <td class="px-4 py-3 text-sm text-slate-500 font-mono whitespace-nowrap">${visit.relId}</td>
                                    <td class="px-4 py-3 text-sm text-slate-500 font-mono whitespace-nowrap">${visit.sid}</td>
                                    <td class="px-4 py-3 whitespace-nowrap">
                                        <a href="${pageContext.request.contextPath}/student/detail/${visit.sid}" class="text-sm font-medium text-indigo-600 hover:text-indigo-700 transition-colors">${visit.sname}</a>
                                    </td>
                                    <td class="px-4 py-3 text-sm text-slate-600 whitespace-nowrap">${visit.className}</td>
                                    <td class="px-4 py-3 text-sm text-slate-500 font-mono whitespace-nowrap">${visit.buildId}</td>
                                    <td class="px-4 py-3 whitespace-nowrap">
                                        <a href="${pageContext.request.contextPath}/building/detail/${visit.buildId}" class="text-sm font-medium text-indigo-600 hover:text-indigo-700 transition-colors">${visit.buildingName}</a>
                                    </td>
                                    <td class="px-4 py-3 text-sm text-slate-600 whitespace-nowrap">
                                        <fmt:formatDate value="${visit.visitTime}" pattern="yyyy年MM月dd日"/>
                                    </td>
                                    <td class="px-4 py-3 whitespace-nowrap">
                                        <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium bg-indigo-50 text-indigo-700">${visit.score}</span>
                                    </td>
                                    <td class="px-4 py-3 whitespace-nowrap">
                                        <div class="flex gap-2">
                                            <button type="button" onclick="location.href='${pageContext.request.contextPath}/update.jsp?relId=${visit.relId}'" class="btn-transition inline-flex items-center px-2.5 py-1 text-xs font-medium text-indigo-600 bg-indigo-50 hover:bg-indigo-100 rounded-lg">更新</button>
                                            <button type="button" onclick="deleteRel(${visit.relId})" class="btn-transition inline-flex items-center px-2.5 py-1 text-xs font-medium text-rose-600 bg-rose-50 hover:bg-rose-100 rounded-lg">删除</button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

    <script>
        function deleteRel(relId) {
            let flag = confirm("确定删除该记录吗？");
            if (flag) {
                window.location.href = "${pageContext.request.contextPath}/visit/deleteRel/" + relId;
            }
        }
        function resetSearch() {
            window.location.href = "${pageContext.request.contextPath}/visit/list";
        }
        function goIndex() {
            window.location.href = "${pageContext.request.contextPath}/index.jsp";
        }
        function goAddRel() {
            window.location.href = "${pageContext.request.contextPath}/add_rel.jsp";
        }
    </script>
</body>
</html>