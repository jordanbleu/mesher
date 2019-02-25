
Mesher
======
*A god awful utility I wrote to write my code for me*
***

How to start
----
You can either load up the Game Maker Studio 2 project or extract the "Mesher.zip" somewhere and run the exe

How to use
----
1. Copy your room's dimensions with obstacles and stuff into the mesher project
2. From that rooms creation code, call  `InitializeMesher();`
3. Run the app
4. Behold the worlds worst UI that I slopped together in like an hour
5. Use the mouse wheel to cycle through Add, Connect, Edit, Delete, or Move
6. Right mouse click will select any nodes you have placed
7. Left mouse click does whatever action you have selected in the menu
8. Move the mouse to the corners to scroll around the level


**Add:**
Adds a new node.  Hold Left Click and release to place.  *Note: nodes will be snapped 
to a number divisible by 32.*

**Connect:**
Connects a node to your selected node.  First, right click a node to select it. Then
left click on the node you'd like to connect.  A line will appear between the two, showing
that these nodes are now connected.  In most cases you should connect the nodes to each other
so remember to do that.  To delete the connection simply click on the node again.

**Range:**
Select a node and drag the handles to adjust the range of the node.  This would be used by your AI
to know when to start pathing towards another node.

**Delete:**
To delete a node, right click to select it, then left click on that selected node and it'll be 
deleted along with any connections to it.

**Move:**
Right click to select a node then click and drag to move it.

**Save:**
Left click to save your work in progress.  Right click to export the code.

**Load**
Pressing ctrl+alt+space with this option highlighted will load a .navmesh file and overwrite your current changes.

**Test**
Use this to actually test the pathing algorithm with your current navigation mesh.  All nodes should be connected to all other nodes for this to work properly.





