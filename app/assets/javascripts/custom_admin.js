var custom_admin=new function(){
    var that=this;

    this.Student=new function(){
        this.StudentSearchByClass=new function(){
            var level_id_selector=$('#level_id');
            level_id_selector.click(function(){
                var level_id=$(this).val();
                var roll_no=$('#search_by_roll_no').val();
                console.log(level_id+'  '+roll_no)
            });
        }
    };
};