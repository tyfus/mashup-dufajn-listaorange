<gm:page title="Lista zadan" class="tasksTheme" css="http://tasklist.googlemashups.com/resources/tasklist.css" authenticate="true">
 
  <!-- The advanced task list application is a simple task list that stores
       tasks per user in the ${user} feed. The application uses hierarchy to 
       display projects and tasks contained in each of those projects. The date
       picker control is also featured in this app.
       @author: GME Team
  --> 

<style>
.tasks .gm-item {
  padding:5px !important;
  font-size:85%;
  border-bottom:1px solid #e6e6e6;
}
</style>

<!-- Table for the header -->
<table width="100%" >
  <tr>
    <td valign="top">
      <div id="header" style="padding-left:15px;padding-top:10px;">
       <div id="logo">
       </div>
      </div>
     </td>
   </tr>
</table>

<table width="100%" >
  <tr valign="top" >
    <td width="200" class="sideTabs" style="padding-left:15px;padding-top:20px;">
      <gm:list id="projList" data="${app}/projects2" template="projForm">
      <!-- 
        <gm:list id="projList" data="${user}/projects2" template="projForm"> 
      -->
        <gm:handleEvent event="select" execute="onSelect(this.object);"/>
      </gm:list>
    </td>
    <td style="padding-right:15px;padding-top:20px;">
      <div id="taskContainer">
        <gm:list id="taskList" data="${app}/tasks" template="taskForm">
          <gm:handleEvent src="projList"/>
        </gm:list>
       </div>
    </td>
  </tr>
</table>

<gm:template id="projForm">
  <gm:create label="Zadanie"/>
   <div style="padding-top:10px;">
   <table width="100%">
     <tbody repeat="true">
       <tr>
         <td width="160" style="padding:5px:"><gm:text style="width:140px;color:blue;text-decoration:underline;" ref="atom:title"/></td>
         <td width="40" style="padding:5px:" nowrap="true"><gm:editButtons editonly="true" class="gm-select-only"/></td>
       </tr>
     </tbody>
    </table>
  </div>
</gm:template>

<gm:template id="taskForm">
  <table width="100%">
    <tr>
      <td colspan="7" height="30px" style="background-color:#C3D9FF;padding:5px;height:30px;-moz-border-radius: 4 4 0 0;">
        <gm:create label="Nowe zadanie"/>
      </td>
    </tr>
   </table>
   <table width="100%">
      <tr width="100%">
        <td width="20" class="gm-header"></td>
          <td width="75" class="gm-header">Zrobione</td>
          <td width="100" class="gm-header">Do</td>
          <td class="gm-header">Zadanie</td>
          <td width="150" nowrap="true" class="gm-header">Wykonuje</td>
          <td width="100" class="gm-header">Priorytet</td>
          <td width="60" class="gm-header"></td>
     </tr>
     <tbody repeat="true" width="100%">
       <tr class="tasks">
         <td width="20" valign="top" align="left" class="gm-item"><gm:toggle/></td>
         <td width="75" align="left" class="gm-item"><gm:checkbox ref="gd:status/@value"/></td>
         <td width="100" align="left" class="gm-item"><gm:date ref="gd:when/@startTime"/></td>
         <td class="gm-item"><gm:text ref="atom:title" gm-focus="true"/></td>
         <td width="150" class="gm-item"><gm:autoComplete ref="gd:assignedTo/@email" data="http://dufajn.googlepages.com/test2.xml" value="title" /></td>
         <!--
         <gm:text ref="gd:assignedTo/@email"/>
         <gm:autoComplete ref="atom:title" data="http://dufajn.googlepages.com/test2.xml" value="title" /> 
         -->
         <td width="100" class="gm-item"><gm:rating ref="gd:priority"/></td>
         <td width="60" class="gm-item"><gm:editButtons editonly="true"/></td>
         <!-- <td><gm:editButtons deleteonly="true"/></td> -->
        </tr>
        <tr class="gm-toggled" width="100%">
          <td colspan="7" class="gm-item"><gm:textarea ref="atom:content" style="white-space:pre"/></td>
        </tr>
     </tbody>
  </table>
  <div id="message" style="text-align:center;color:gray;margin-top:4em;">Problemy prosze zglaszac mailem.</div>

   <table width="100%" style="margin-top:4em" >
    <tr>
     <td colspan="7" style="background-color:#C3D9FF;padding:5px;height:30px;-moz-border-radius: 0 0 4 4" >
        <gm:create label="Nowe zadanie"/>
     </td>
    </tr>
  </table>
</gm:template>

<script>
function onSelect(o) {
  var div = document.getElementById("taskContainer");
  if (div.style.display == "none"){
     div.style.display ="block";
  }

  var div2 = document.getElementById("message");
  div2.style["display"] = "none";
}
</script>

</gm:page>

