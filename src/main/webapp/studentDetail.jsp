<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生详情 - ${student.sname}</title>
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
        .btn-hover { transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1); }
        .btn-hover:active { transform: scale(0.97); }
    </style>
</head>
<body class="bg-slate-50 min-h-screen">
    <nav class="fixed top-0 inset-x-0 z-50 bg-white/80 glass-nav border-b border-slate-200/60">
        <div class="max-w-7xl mx-auto px-6 h-14 flex items-center justify-between">
            <a href="${pageContext.request.contextPath}/visit/list" class="inline-flex items-center text-sm font-medium text-slate-500 hover:text-slate-900 transition-colors">
                <svg class="w-4 h-4 mr-1.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 18-6-6 6-6"/></svg>
                返回列表
            </a>
            <span class="text-sm font-semibold text-slate-800">学生详情</span>
            <div class="w-20"></div>
        </div>
    </nav>
    <main class="pt-20 pb-16 px-6">
        <div class="max-w-lg mx-auto">
            <div class="bg-white rounded-2xl border border-slate-200/60 shadow-sm overflow-hidden mb-8">
                <div class="px-6 py-5 border-b border-slate-100">
                    <h2 class="text-lg font-semibold text-slate-900">学生信息</h2>
                    <p class="text-sm text-slate-500 mt-0.5">${student.sname}</p>
                </div>
                <div class="divide-y divide-slate-100">
                    <div class="flex px-6 py-4"><span class="w-24 flex-shrink-0 text-sm font-medium text-slate-500">学号</span><span class="text-sm text-slate-900 font-mono">${student.sid}</span></div>
                    <div class="flex px-6 py-4"><span class="w-24 flex-shrink-0 text-sm font-medium text-slate-500">姓名</span><span class="text-sm font-semibold text-slate-900">${student.sname}</span></div>
                    <div class="flex px-6 py-4"><span class="w-24 flex-shrink-0 text-sm font-medium text-slate-500">性别</span><span class="text-sm text-slate-700"><c:if test="${student.gender.trim()=='1'}">男</c:if><c:if test="${student.gender.trim()=='0'}">女</c:if></span></div>
                    <div class="flex px-6 py-4"><span class="w-24 flex-shrink-0 text-sm font-medium text-slate-500">班级</span><span class="text-sm text-slate-700">${student.classname}</span></div>
                </div>
            </div>
            <div class="flex flex-wrap gap-3">
                <a href="${pageContext.request.contextPath}/student/toUpdatePage?sid=${student.sid}" class="btn-hover inline-flex items-center px-5 py-2.5 text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 rounded-xl shadow-sm">
                    <svg class="w-4 h-4 mr-1.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/><path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/></svg>修改学生信息</a>
                <button type="button" onclick="deleteStudent(${student.sid})" class="btn-hover inline-flex items-center px-5 py-2.5 text-sm font-medium text-rose-600 bg-rose-50 hover:bg-rose-100 border border-rose-200/60 rounded-xl">
                    <svg class="w-4 h-4 mr-1.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg>删除学生</button>
                <button type="button" onclick="location.href='${pageContext.request.contextPath}/visit/list'" class="btn-hover inline-flex items-center px-5 py-2.5 text-sm font-medium text-slate-600 bg-white border border-slate-200 hover:bg-slate-50 rounded-xl">
                    <svg class="w-4 h-4 mr-1.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 18-6-6 6-6"/></svg>返回列表</button>
            </div>
        </div>
    </main>
    <script>
        function deleteStudent(sid) {
            let flag = confirm("确定删除该学生吗？");
            if (flag) {
                window.location.href = "${pageContext.request.contextPath}/student/delete/" + sid;
            }
        }
    </script>
</body>
</html>