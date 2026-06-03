<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改学生信息</title>
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
            <span class="text-sm font-semibold text-slate-800">修改学生信息</span>
            <div class="w-20"></div>
        </div>
    </nav>
    <main class="pt-20 pb-16 px-6">
        <div class="max-w-md mx-auto">
            <div class="bg-white rounded-2xl border border-slate-200/60 shadow-sm overflow-hidden">
                <div class="px-6 py-5 border-b border-slate-100">
                    <h2 class="text-lg font-semibold text-slate-900">修改学生信息</h2>
                    <p class="text-sm text-slate-500 mt-0.5">${student.sname}</p>
                </div>
                <div class="p-6 space-y-5">
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">学号</label>
                        <input type="text" id="sid" value="${student.sid}" readonly class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl bg-slate-50 text-slate-500">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">姓名</label>
                        <input type="text" id="sname" value="${student.sname}" placeholder="请输入姓名" class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 transition-shadow">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">性别</label>
                        <input type="text" id="gender" value="${student.gender == '1' ? '男' : '女'}" placeholder="请输入 男 或 女" class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 transition-shadow">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-slate-700 mb-1.5">班级</label>
                        <input type="text" id="classname" value="${student.classname}" placeholder="请输入班级" class="w-full px-4 py-2.5 text-sm border border-slate-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500/20 focus:border-indigo-400 transition-shadow">
                    </div>
                    <button type="button" onclick="submitForm()" class="btn-hover w-full py-2.5 text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 rounded-xl shadow-sm mt-2">提交修改</button>
                </div>
            </div>
        </div>
    </main>
    <script>
        function submitForm() {
            let sid = document.getElementById("sid").value.trim();
            let sname = document.getElementById("sname").value.trim();
            let gender = document.getElementById("gender").value.trim();
            let classname = document.getElementById("classname").value.trim();
            if (!sid || !sname || !gender || !classname) { alert("所有项都不能为空！"); return; }
            let genderCode = "";
            if (gender === "男") { genderCode = "1"; }
            else if (gender === "女") { genderCode = "0"; }
            else { alert("性别只能填：男 或 女"); return; }
            let student = { sid: parseInt(sid), sname: sname, gender: genderCode, classname: classname };
            fetch("${pageContext.request.contextPath}/rel/updateStudent", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(student)
            })
            .then(res => res.json())
            .then(data => {
                alert(data.msg);
                if (data.code === 200 || data.msg.indexOf("成功") !== -1) {
                    window.location.href = "${pageContext.request.contextPath}/visit/list";
                }
            })
            .catch(err => { alert("请求失败"); });
        }
    </script>
</body>
</html>