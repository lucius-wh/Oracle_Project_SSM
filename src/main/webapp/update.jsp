<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改参观记录</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script>tailwind.config={theme:{extend:{fontFamily:{sans:['Inter','system-ui','-apple-system','Segoe UI','sans-serif']}}}}}</script>
    <style>.glass-nav{backdrop-filter:blur(20px) saturate(180%);-webkit-backdrop-filter:blur(20px) saturate(180%)}.btn-hover{transition:all .2s cubic-bezier(.4,0,.2,1)}.btn-hover:active{transform:scale(.97)}input[readonly]{background-color:#f8fafc;cursor:not-allowed}</style>
</head>
<body class="bg-slate-50 min-h-screen">
    <nav class="fixed top-0 inset-x-0 z-50 bg-white/80 glass-nav border-b border-slate-200/60">
        <div class="max-w-7xl mx-auto px-6 h-14 flex items-center justify-between">
            <a href="${pageContext.request.contextPath}/visit/list" class="inline-flex items-center text-sm font-medium text-slate-500 hover:text-slate-900 transition-colors">
                <svg class="w-4 h-4 mr-1.5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="m15 18-6-6 6-6"/></svg>返回列表</a>
            <span class="text-sm font-semibold text-slate-800">修改参观记录</span>
            <div class="w-20"></div>
        </div>
    </nav>
    <main class="pt-20 pb-16 px-6">
        <div class="max-w-md mx-auto">
            <div class="bg-white rounded-2xl border border-slate-200/60 shadow-sm overflow-hidden">
                <div class="px-6 py-5 border-b border-slate-100">
                    <h2 class="text-lg font-semibold text-slate-900">修改参观记录</h2>
                    <p class="text-sm text-slate-500 mt-0.5">记录 ID: <span id="relIdDisplay" class="font-mono font-medium text-slate-700"></span></p>
                </div>
                <div class="p-6 space-y-5">
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">记录 ID</label>
                        <input type="text" id="relId" readonly class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl bg-slate-50 text-slate-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">学生 ID</label>
                        <input type="text" id="sid" placeholder="请输入学生ID" class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 transition-shadow">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">建筑 ID</label>
                        <input type="text" id="buildId" placeholder="请输入建筑ID" class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 transition-shadow">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">评分</label>
                        <input type="text" id="score" placeholder="请输入评分（如 96.0）" class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 transition-shadow">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">参观时间</label>
                        <input type="datetime-local" id="visitTime" class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 transition-shadow">
                    </div>
                    <div class="flex gap-3 pt-2">
                        <button type="button" onclick="submitForm()" class="btn-hover flex-1 py-2.5 text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 rounded-xl shadow-sm">提交修改</button>
                        <button type="button" onclick="backToList()" class="btn-hover px-6 py-2.5 text-sm font-medium text-slate-600 bg-white border border-slate-200 hover:bg-slate-50 rounded-xl">返回列表</button>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <script>
        const ctx = "${pageContext.request.contextPath}";
        function getUrlParam(name) {
            let reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            let r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]);
            return null;
        }
        window.onload = function () {
            let relId = getUrlParam("relId");
            if (!relId) { alert("记录ID不能为空，请从列表页进入！"); backToList(); return; }
            document.getElementById("relId").value = relId;
            document.getElementById("relIdDisplay").textContent = relId;
        };
        function submitForm() {
            let rel = {
                relId: parseInt(document.getElementById("relId").value),
                sid: parseInt(document.getElementById("sid").value),
                buildId: parseInt(document.getElementById("buildId").value),
                score: parseFloat(document.getElementById("score").value),
                visitTime: document.getElementById("visitTime").value
            };
            fetch(ctx + "/rel/update", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(rel)
            })
            .then(res => res.json())
            .then(data => {
                alert(data.msg);
                if (data.code === 200) { backToList(); }
            })
            .catch(err => { alert("请求失败，请查看控制台日志"); });
        }
        function backToList() {
            window.location.href = ctx + "/visit/list";
        }
    </script>
</body>
</html>