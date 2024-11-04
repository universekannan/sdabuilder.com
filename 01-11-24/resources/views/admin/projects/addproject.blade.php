@extends('admin/layouts.app')
@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h3 class="card-title">Add Project</h3>
                </div>
                <div class="card-body">

                    <form action="{{ url('saveproject') }}" method="post" enctype="multipart/form-data">
                        {{ csrf_field() }}
                       
            
                      <div class="form-group row">
                          <label for="project_status_id" class="col-sm-2 col-form-label"><span
                            style="color:red">*</span>Project type</label>
                            <div class="col-sm-10">
                                <select required="required" type="text" class="form-control"
                                name="project_status_id" maxlength="50">
                                <option>Select</option>
                                    <option value="1">Upcoming Projects</option>
                                    <option value="2">Progress Projects</option>
                                    <option value="3">Completed Projects</option>
                                </select>
                            </div>
                        </div>
           
                        <div class="form-group row">
                          <label for="project_name" class="col-sm-2 col-form-label"><span
                             style="color:red">*</span>Project Name</label>
                            <div class="col-sm-10">
                                <input required="required" type="text" class="form-control"
                                name="project_name" maxlength="50" placeholder="Project Name">
                            </div>
                        </div>

                        <div class="form-group row">
                          <label for="project_owner" class="col-sm-2 col-form-label"><span
                            style="color:red">*</span>Project owner</label>
                            <div class="col-sm-10">
                                <input required="required" type="text" class="form-control"
                                name="project_owner" maxlength="50" placeholder="Project owner">
                            </div>
                        </div>
                            
                        <div class="form-group row">
                           <label for="project_mobile" class="col-sm-2 col-form-label"><span
                            style="color:red">*</span>Mobile</label>
                            <div class="col-sm-10">
                                <input required="required" type="text" class="form-control"
                                name="project_mobile" maxlength="50" placeholder="Mobile number">
                            </div>
                        </div>

                                <div class="form-group row">
                                  <label for="project_email" class="col-sm-2 col-form-label"><span
                                    style="color:red">*</span>Email</label>
                                    <div class="col-sm-10">
                                        <input required="required" type="text" class="form-control"
                                        name="project_email" maxlength="50" placeholder="Email address">
                                    </div>
                                </div>

                                <div class="form-group row">
                                   <label for="project_amount" class="col-sm-2 col-form-label"><span
                                    style="color:red">*</span>Project amount</label>
                                    <div class="col-sm-10">
                                        <input required="required" type="text" class="form-control"
                                        name="project_amount" maxlength="50" placeholder="Project Amount">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="photo" class="col-sm-2 col-form-label"><span
                                        style="color:red">*</span>Project Image</label>
                                        <div class="col-sm-10">
                                            <input type="file" required="required" class="form-control" name="photo" maxlength="100" type="photo">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group row">
                                  <label for="project_address" class="col-sm-2 col-form-label"><span
                                    style="color:red">*</span>Project address</label>
                                    <div class="col-sm-10">
                                        <textarea required="required" type="text" class="form-control"
                                        name="project_address"  placeholder="Email address">
                                        </textarea>
                                    </div>
                                </div>

                                <div class="col-md-12 text-center">
                                    <a class="btn btn-primary" href="{{ url('admin/project') }}">Back</a>
                                    <input class="btn btn-primary" type="submit" value="Next" />
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@push('page_scripts')
<script src="https://adminlte.io/themes/AdminLTE/bower_components/ckeditor/ckeditor.js"></script>
<script src="https://adminlte.io/themes/AdminLTE/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script>
    $(function() {
// Replace the <textarea id="editor1"> with a CKEditor
// instance, using default configuration.
        CKEDITOR.replace('editor1')
//bootstrap WYSIHTML5 - text editor
        $('.textarea').wysihtml5()
    })
</script>
<script>
    function edit_project(id, project_name, project_owner,project_mobile,project_email,project_amount , photo , project_address) {
        $("#editid").val(id);
        $("#editprojectname").val(project_name);
        $("#editprojectowner").val(project_owner);
        $("#editprojectmobile").val(project_mobile);
        $("#editprojectemail").val(project_email);
        $("#editprojectamount").modal(project_amount);
        $("#editphoto").modal(photo);
        $("#editprojectaddress").modal(project_address);
         $("#editproject").modal("show");
    }

    $('#cat_id').on('change', function() {
        var cat_id = this.value;
        $("#sub_cat_id").html('');
        $.ajax({
            url: "{{ url('getsubcategory') }}",
            type: "POST",
            data: {
                cat_id: cat_id,
                _token: '{{ csrf_token() }}'
            },
            dataType: 'json',
            success: function(result) {
                $('#sub_cat_id').html('<option value="">Select Sub Category</option>');
                $.each(result, function(key, value) {
                    $("#sub_cat_id").append('<option value="' + value
                        .id + '">' + value.category_name + '</option>');
                });
            }
        });
    });

    if(value.attr_type == "text"){
        $("#attrdiv").append("<div class='form-group row'><label class='col-sm-2 col-form-label'>"+value.attr_name+"</label> <div class='col-sm-10'><input name='"+name+"' type='text' maxlength='100' class='form-control'/></div></div>");
    }else if(value.attr_type == "date"){
        $("#attrdiv").append("<div class='form-group row'><label class='col-sm-2 col-form-label'>"+value.attr_name+"</label><div class='col-sm-10'><input name='"+name+"' onkeyup='return false' type='date' class='form-control'  /></div></div>");
    }else if(value.attr_type == "textarea"){
        $("#attrdiv").append("<div class='form-group row'><label class='col-sm-2 col-form-label'>"+value.attr_name+"</label><div class='col-sm-10'><textarea name='"+name+"' maxlength='500' class='form-control' ></textarea></div></div>");
    }else if(value.attr_type == "dropdown"){
        option = "<option value=''>Select</option>";
        myArray = value.attr_value.split(",");
        let j = 0;
        while (j < myArray.length) {
            option = option + "<option value='"+myArray[j]+"' >"+myArray[j]+"</option>";
            j++;
        }
        $("#attrdiv").append("<div class='form-group row'><label class='col-sm-2 col-form-label'>"+value.attr_name+"</label><div class='col-sm-10'><select name='"+name+"' class='form-control'>"+option+"</select></div></div>");
    }else if(value.attr_type == "checkbox"){
        option = "";
        myArray = value.attr_value.split(",");
        let j = 0;
        option = "<label class='col-sm-2 col-form-label'>"+value.attr_name+"&nbsp;</label>";
        while (j < myArray.length) {
            option = option + "<label ><input name='"+name +"[]' type='checkbox' class='checkbox-inline ' value='"+myArray[j]+"' />&nbsp;"+myArray[j].toString()+"&nbsp;</label>";
            j++;
        }
        console.log(option);
        $("#attrdiv").append("<div class='form-group row'>"+option +"</div>");
    }
    $('#sub_cat_id').on('change', function() {
        var cat_id = $("#cat_id").val();
        var sub_cat_id = this.value;
        $("#attrdiv").html('');
        $.ajax({
            url: "{{ url('getattributes') }}",
            type: "POST",
            data: {
                cat_id: cat_id,
                sub_cat_id: sub_cat_id,
                _token: '{{ csrf_token() }}'
            },
            dataType: 'json',
            success: function(result) {
                for (let i = 0; i < result.length; i++) {
                    value = result[i];
                    if (value.attr_type == "checkbox") {
                        name = "attr_check_" + result[i].id;
                    } else {
                        name = "attr_" + result[i].id;
                    }

                    if (value.attr_type == "text") {
                        $("#attrdiv").append(
                            "<div class='form-group row'><label class='col-sm-2 col-form-label'>" +
                            value.attr_name + "</label> <div class='col-sm-10'><input name='" +
                            name +
                            "' type='text' maxlength='100' class='form-control'  /></div></div>"
                            );
                    } else if (value.attr_type == "date") {
                        $("#attrdiv").append("<div class='form-group col-md-6'><label>" + value
                            .attr_name + "</label><input name='" + name +
                            "' onkeyup='return false' type='date'  class='form-control'  /></div>"
                            );
                    } else if (value.attr_type == "textarea") {
                        $("#attrdiv").append("<div class='form-group col-md-6'><label>" + value
                            .attr_name + "</label><textarea name='" + name +
                            "' maxlength='500' class='form-control' ></textarea></div>");
                    } else if (value.attr_type == "dropdown") {
                        option = "<option value=''>Select</option>";
                        myArray = value.attr_value.split(",");
                        let j = 0;
                        while (j < myArray.length) {
                            option = option + "<option value='" + myArray[j] + "' >" + myArray[j] +
                            "</option>";
                            j++;
                        }
                        $("#attrdiv").append("<div class='form-group col-md-6'><label>" + value
                            .attr_name + "</label><select name='" + name +
                            "' class='form-control'>" + option + "</select></div>");
                    } else if (value.attr_type == "checkbox") {
                        option = "";
                        myArray = value.attr_value.split(",");
                        let j = 0;
                        option = "<label>" + value.attr_name + "&nbsp;</label>";
                        while (j < myArray.length) {
                            option = option + "<label class='checkbox-inline' ><input name='" +
                            name + "[]' type='checkbox' value='" + myArray[j] + "' />&nbsp;" +
                            myArray[j].toString() + "&nbsp;</label>";
                            j++;
                        }
                        $("#attrdiv").append("<div class='col-md-12'>" + option + "</div>");
                    }
                }
            },
            error: function(result) {
                console.log(result);
            }
        });
    });


    $(".decimal").keypress(function(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode != 46 && charCode > 31 &&
            (charCode < 48 || charCode > 57)) {
            return false;
    }
    if (charCode == 46 && this.value.indexOf(".") !== -1) {
        return false;
    }
    return true;
});
</script>
<script>
    $(function() {
        bsCustomFileInput.init();
    });

    var counter = 1;
    var dynamicInput = [];

    function addInput(){
        var newdiv = document.createElement('div');
        newdiv.id = dynamicInput[counter];
        newdiv.innerHTML = "Entry " + (counter + 1) + " <br><input type='text' name='myInputs[]'> <input type='button' value='-' onClick='removeInput("+dynamicInput[counter]+");'>";
        document.getElementById('addstores').appendChild(newdiv);
        counter++;
    }

    function removeInput(id){
        var elem = document.getElementById(id);
        return elem.parentNode.removeChild(elem);
    }




</script>

@endpush
