const base = {
    get() {
        return {
            url : "http://localhost:8080/vuejianshenfang/",
            name: "vuejianshenfang",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/vuejianshenfang/front/dist/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "健身房管理系统"
        } 
    }
}
export default base
