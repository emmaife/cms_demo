tinymce.PluginManager.add("anchor",function(n){function e(){var e=n.selection.getNode();n.windowManager.open({title:"Anchor",body:{type:"textbox",name:"name",size:40,label:"Name",value:e.name||e.id},onsubmit:function(e){n.execCommand("mceInsertContent",!1,n.dom.createHTML("a",{id:e.data.name}))}})}n.addButton("anchor",{icon:"anchor",tooltip:"Anchor",onclick:e,stateSelector:"a:not([href])"}),n.addMenuItem("anchor",{icon:"anchor",text:"Anchor",context:"insert",onclick:e})});
