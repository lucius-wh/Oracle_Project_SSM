<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>古建筑详情 - ${building.buildingName}</title>
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
        .image-slot { transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1); }
        .image-slot:hover { border-color: #a5b4fc; background-color: #eef2ff; }
    </style>
</head>
<body class="bg-slate-50 min-h-screen">
    <nav class="fixed top-0 inset-x-0 z-50 bg-white/80 glass-nav border-b border-slate-200/60">
        <div class="max-w-7xl mx-auto px-6 h-14 flex items-center justify-between">
            <a href="${pageContext.request.contextPath}/visit/list"
               class="inline-flex items-center text-sm font-medium text-slate-500 hover:text-slate-900 transition-colors">
                <svg class="w-4 h-4 mr-1.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 18-6-6 6-6"/></svg>
                返回列表
            </a>
            <span class="text-sm font-semibold text-slate-800 truncate max-w-xs">${building.buildingName}</span>
            <div class="w-20"></div>
        </div>
    </nav>

    <main class="pt-20 pb-16 px-6">
        <div class="max-w-6xl mx-auto">
            <div class="grid grid-cols-1 lg:grid-cols-5 gap-8">
                <!-- Left: Image Gallery -->
                <div class="lg:col-span-2 space-y-6">
                    <div class="image-slot relative bg-white rounded-2xl border-2 border-dashed border-slate-300 overflow-hidden shadow-sm aspect-[4/3] flex items-center justify-center group cursor-pointer">
                        <div class="text-center px-4">
                            <svg class="w-12 h-12 text-slate-300 mx-auto mb-3 group-hover:text-indigo-400 transition-colors" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/>
                            </svg>
                            <p class="text-sm font-medium text-slate-400 group-hover:text-indigo-500 transition-colors">建筑外观图</p>
                            <p class="text-xs text-slate-300 mt-1">点击或拖拽上传图片</p>
                        </div>
                    </div>
                    <div class="image-slot relative bg-white rounded-2xl border-2 border-dashed border-slate-300 overflow-hidden shadow-sm aspect-[4/3] flex items-center justify-center group cursor-pointer">
                        <div class="text-center px-4">
                            <svg class="w-12 h-12 text-slate-300 mx-auto mb-3 group-hover:text-indigo-400 transition-colors" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="3" y="3" width="18" height="18" rx="2" ry="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/>
                            </svg>
                            <p class="text-sm font-medium text-slate-400 group-hover:text-indigo-500 transition-colors">建筑细节图</p>
                            <p class="text-xs text-slate-300 mt-1">点击或拖拽上传图片</p>
                        </div>
                    </div>
                </div>

                <!-- Right: Building Details -->
                <div class="lg:col-span-3">
                    <div class="bg-white rounded-2xl border border-slate-200/60 shadow-sm overflow-hidden">
                        <div class="px-6 py-5 border-b border-slate-100">
                            <h2 class="text-lg font-semibold text-slate-900">建筑信息</h2>
                            <p class="text-sm text-slate-500 mt-0.5">${building.areaName}</p>
                        </div>
                        <div class="divide-y divide-slate-100">
                            <div class="flex px-6 py-4"><span class="w-28 flex-shrink-0 text-sm font-medium text-slate-500">建筑 ID</span><span class="text-sm text-slate-900">${building.id}</span></div>
                            <div class="flex px-6 py-4"><span class="w-28 flex-shrink-0 text-sm font-medium text-slate-500">地区编码</span><span class="text-sm text-slate-900 font-mono">${building.areaCode}</span></div>
                            <div class="flex px-6 py-4"><span class="w-28 flex-shrink-0 text-sm font-medium text-slate-500">地区名称</span><span class="text-sm text-slate-900">${building.areaName}</span></div>
                            <div class="flex px-6 py-4"><span class="w-28 flex-shrink-0 text-sm font-medium text-slate-500">建筑名称</span><span class="text-sm font-semibold text-slate-900">${building.buildingName}</span></div>
                            <div class="flex px-6 py-4"><span class="w-28 flex-shrink-0 text-sm font-medium text-slate-500">建筑地址</span><span class="text-sm text-slate-700">${building.address}</span></div>
                            <div class="flex px-6 py-4"><span class="w-28 flex-shrink-0 text-sm font-medium text-slate-500">建造年代</span><span class="text-sm text-slate-700">${building.buildYear}</span></div>
                            <div class="flex px-6 py-4"><span class="w-28 flex-shrink-0 text-sm font-medium text-slate-500">保护等级</span><span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-amber-50 text-amber-700 border border-amber-200/60">${building.protectionLevel}</span></div>
                            <div class="flex px-6 py-4"><span class="w-28 flex-shrink-0 text-sm font-medium text-slate-500">建筑类型</span><span class="text-sm text-slate-700">${building.buildType}</span></div>
                            <div class="flex px-6 py-4"><span class="w-28 flex-shrink-0 text-sm font-medium text-slate-500">建筑简介</span><span class="text-sm text-slate-700 leading-relaxed">${building.introduction}</span></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>