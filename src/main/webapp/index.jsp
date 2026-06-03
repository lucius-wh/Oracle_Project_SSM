<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>古建筑参观管理系统</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
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
        .glass-nav {
            backdrop-filter: blur(20px) saturate(180%);
            -webkit-backdrop-filter: blur(20px) saturate(180%);
        }
        .card-transition {
            transition: all 0.35s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .card-transition:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 40px -12px rgba(79, 70, 229, 0.15), 0 0 0 1px rgba(79, 70, 229, 0.1);
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .animate-in {
            animation: fadeInUp 0.6s cubic-bezier(0.4, 0, 0.2, 1) forwards;
        }
        .delay-100 { animation-delay: 0.1s; opacity: 0; }
        .delay-200 { animation-delay: 0.2s; opacity: 0; }
        .delay-300 { animation-delay: 0.3s; opacity: 0; }
    </style>
</head>
<body class="bg-slate-50 min-h-screen">
    <div class="fixed inset-0 -z-10 overflow-hidden">
        <div class="absolute -top-40 -right-40 w-96 h-96 bg-indigo-100/60 rounded-full blur-3xl"></div>
        <div class="absolute -bottom-40 -left-40 w-96 h-96 bg-blue-100/40 rounded-full blur-3xl"></div>
    </div>

    <div class="flex items-center justify-center min-h-screen px-6 py-20">
        <div class="w-full max-w-4xl">
            <div class="text-center mb-16 animate-in delay-100">
                <div class="inline-flex items-center justify-center w-20 h-20 rounded-2xl bg-white border border-slate-200/60 shadow-sm mb-8">
                    <svg class="w-10 h-10 text-indigo-600" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M3 21h18"/><path d="M3 7v14"/><path d="M21 7v14"/><path d="M6 11h4v10H6z"/><path d="M14 11h4v10h-4z"/><path d="M5 3l2-1 2 1 2-1 2 1 2-1 2 1 2-1 2 1"/>
                    </svg>
                </div>
                <h1 class="text-5xl font-extrabold text-slate-900 tracking-tight leading-tight">
                    古建筑参观<span class="text-indigo-600">管理</span>系统
                </h1>
                <p class="mt-4 text-lg text-slate-500 max-w-lg mx-auto">
                    高效管理学生参观记录与古建筑信息，让文化传承更加有序
                </p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <a href="${pageContext.request.contextPath}/visit/list"
                   class="card-transition animate-in delay-200 group block bg-white rounded-2xl border border-slate-200/60 p-8 shadow-sm">
                    <div class="w-12 h-12 rounded-xl bg-indigo-50 flex items-center justify-center mb-6 group-hover:bg-indigo-100 transition-colors duration-300">
                        <svg class="w-6 h-6 text-indigo-600" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M9 5H7a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-2"/><rect x="9" y="3" width="6" height="4" rx="1"/><path d="M9 14l2 2 4-4"/>
                        </svg>
                    </div>
                    <h3 class="text-xl font-semibold text-slate-900 mb-3">学生参观记录管理</h3>
                    <p class="text-sm text-slate-500 leading-relaxed mb-8">
                        查看、管理学生参观古建筑的评分记录，支持多条件筛选、更新与删除操作
                    </p>
                    <span class="inline-flex items-center text-sm font-medium text-indigo-600 group-hover:text-indigo-700 transition-colors">
                        进入管理
                        <svg class="w-4 h-4 ml-1.5 group-hover:translate-x-0.5 transition-transform duration-200" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M5 12h14"/><path d="m12 5 7 7-7 7"/>
                        </svg>
                    </span>
                </a>

                <a href="${pageContext.request.contextPath}/building/page"
                   class="card-transition animate-in delay-300 group block bg-white rounded-2xl border border-slate-200/60 p-8 shadow-sm">
                    <div class="w-12 h-12 rounded-xl bg-blue-50 flex items-center justify-center mb-6 group-hover:bg-blue-100 transition-colors duration-300">
                        <svg class="w-6 h-6 text-blue-600" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M3 21h18"/><path d="M5 21V7l8-4v18"/><path d="M19 21V11l-6-4"/><path d="M9 9v.01"/><path d="M9 12v.01"/><path d="M9 15v.01"/><path d="M9 18v.01"/>
                        </svg>
                    </div>
                    <h3 class="text-xl font-semibold text-slate-900 mb-3">古建筑信息目录</h3>
                    <p class="text-sm text-slate-500 leading-relaxed mb-8">
                        浏览全部古建筑信息，查看建筑详情，支持分页查询与数据维护
                    </p>
                    <span class="inline-flex items-center text-sm font-medium text-blue-600 group-hover:text-blue-700 transition-colors">
                        进入目录
                        <svg class="w-4 h-4 ml-1.5 group-hover:translate-x-0.5 transition-transform duration-200" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M5 12h14"/><path d="m12 5 7 7-7 7"/>
                        </svg>
                    </span>
                </a>
            </div>

            <p class="text-center text-xs text-slate-400 mt-16 animate-in delay-300">
                古建筑参观管理系统 &copy; 2024
            </p>
        </div>
    </div>
</body>
</html>