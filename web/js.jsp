<script>
            const setting = document.getElementById("setting");
            const childsetting = document.getElementById("animatesetting");
            const opensetting = document.getElementById("opensetting");
            const closesetting = document.getElementById("exitsetting");
            opensetting.addEventListener("click", () => {
                setting.classList.add("opensetting");
                setting.classList.remove("closesetting");
                setTimeout(() => {
                    childsetting.classList.add("animated");
                    childsetting.classList.remove("non-animated");
                }, 200);
            });
            closesetting.addEventListener("click", () => {
                childsetting.classList.remove("animated");
                childsetting.classList.add("non-animated");
                setTimeout(() => {
                    setting.classList.remove("opensetting");
                    setting.classList.add("closesetting");
                }, 500);
            });
        </script>