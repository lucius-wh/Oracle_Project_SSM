<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>新增参观记录</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script>tailwind.config={theme:{extend:{fontFamily:{sans:['Inter','system-ui','-apple-system','Segoe UI','sans-serif']}}}}}</script>
    <style>.glass-nav{backdrop-filter:blur(20px) saturate(180%);-webkit-backdrop-filter:blur(20px) saturate(180%)}.btn-hover{transition:all .2s cubic-bezier(.4,0,.2,1)}.btn-hover:active{transform:scale(.97)}</style>
</head>
<body class="bg-slate-50 min-h-screen">
    <nav class="fixed top-0 inset-x-0 z-50 bg-white/80 glass-nav border-b border-slate-200/60">
        <div class="max-w-7xl mx-auto px-6 h-14 flex items-center justify-between">
            <a href="${pageContext.request.contextPath}/visit/list" class="inline-flex items-center text-sm font-medium text-slate-500 hover:text-slate-900 transition-colors">
                <svg class="w-4 h-4 mr-1.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 18-6-6 6-6"/></svg>返回列表</a>
            <span class="text-sm font-semibold text-slate-800">新增参观记录</span>
            <div class="w-20"></div>
        </div>
    </nav>
    <main class="pt-20 pb-16 px-6">
        <div class="max-w-md mx-auto">
            <div class="bg-white rounded-2xl border border-slate-200/60 shadow-sm overflow-hidden">
                <div class="px-6 py-5 border-b border-slate-100">
                    <h2 class="text-lg font-semibold text-slate-900">新增参观记录</h2>
                    <p class="text-sm text-slate-500 mt-0.5">填写以下信息完成添加</p>
                </div>
                <div class="p-6 space-y-5">
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">学生 ID</label>
                        <input type="text" id="sid" class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 transition-shadow" placeholder="请输入学生ID">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">建筑 ID</label>
                        <input type="text" id="buildId" class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 transition-shadow" placeholder="请输入建筑ID">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">评分</label>
                        <input type="text" id="score" class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 transition-shadow" placeholder="请输入评分（如 96.0）">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">参观时间</label>
                        <input type="datetime-local" id="visitTime" class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 transition-shadow">
                    </div>
                    <button type="button" onclick="submitForm()" class="btn-hover w-full py-2.5 text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 rounded-xl shadow-sm mt-2">提交保存</button>
                </div>
            </div>
        </div>
    </main>
    <script>
        function submitForm() {
            let rel = {
                sid: parseInt(document.getElementById("sid").value),
                buildId: parseInt(document.getElementById("buildId").value),
                score: parseFloat(document.getElementById("score").value),
                visitTime: document.getElementById("visitTime").value
            };
            fetch("${pageContext.request.contextPath}/rel/add", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(rel)
            })
            .then(res => res.json())
            .then(data => {
                if (data.code === 200) {
                    alert(data.msg);
                    window.location.href = "${pageContext.request.contextPath}/visit/list";
                } else if (data.msg.includes("学生不存在")) {
                    alert(data.msg);
                    window.location.href = "${pageContext.request.contextPath}/add.jsp";
                } else {
                    alert(data.msg);
                }
            })
            .catch(err => { alert("请求失败，请查看控制台日志"); });
        }
    </script>
</body>
</html>