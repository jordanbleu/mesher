if (updatePath)
{
	ds_stack_clear(stack);
	ds_list_clear(nodes);
	MapRoute(stack, requestedStartNode, requestedEndNode);
	
	while (!ds_stack_empty(stack))
	{
		ds_list_add(nodes,ds_stack_pop(stack));
	}

	updatePath = false;
}