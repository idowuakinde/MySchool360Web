//Top Nav bar script v2.1- http://www.dynamicdrive.com/dynamicindex1/sm/index.htm

function showToolbar()
{
// AddItem(id, text, hint, location, alternativeLocation);
// AddSubItem(idParent, text, hint, location, linktarget);

	menu = new Menu();
	menu.addItem("TeconGroup", "The Tecon Group", "The Tecon Group",  null, null);
	menu.addItem("Values", "Our Values", "Our Values",  null, null);
	menu.addItem("Proc", "Processes and Procedures", "Processes and Procedures",  null, null);
	menu.addItem("ISO", "ISO Certification", "ISO Certification",  null, null);
	menu.addItem("Cont", "Contact", "Contact",  null, null);

	menu.addSubItem("TeconGroup", "Our Services", "Our Services",  "#", "");
	menu.addSubItem("TeconGroup", "Strategic Business Units", "Strategic Business Units",  "#", "");
	menu.addSubItem("TeconGroup", "The Management Team", "The Management Team",  "#", "");

	menu.addSubItem("Values", "Our Vision", "Our Vision",  "#", null);
	menu.addSubItem("Values", "Our Mission", "Our Mission",  "#", null);
	menu.addSubItem("Values", "Quality @ Tecon", "Quality @ Tecon",  "#", null);
	menu.addSubItem("Values", "ISO 9001:2000", "ISO 9001:2000",  "#", null);

	menu.addSubItem("Proc", "Operational Process 1", "Ops Process 1",  "#", "");
	menu.addSubItem("Proc", "Operational Process 2", "Ops Process 2",  "#", "");
	menu.addSubItem("Proc", "Operational Process 3", "Ops Process 3",  "#", "");
	menu.addSubItem("Proc", "Operational Process 4", "Ops Process 4",  "#", "");
	menu.addSubItem("Proc", "Service Procedure 1", "Service Procedure 1",  "#", "");
	menu.addSubItem("Proc", "Service Procedure 2", "Service Procedure 2",  "#", "");
	menu.addSubItem("Proc", "Service Procedure 3", "Service Procedure 3",  "#", "");

	menu.addSubItem("ISO", "ISO Certification", "ISO Certification",  "#", "");

	menu.addSubItem("Cont", "Contact Information", "Contact Information",  "#", "");

	menu.showMenu();
}