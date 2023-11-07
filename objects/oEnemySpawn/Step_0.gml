//show_debug_message(distance_to_object(oPlayer))

// Check if the player is within the spawn range of an enemy
if distance_to_object(oPlayer) < spawnRange {
    show_debug_message("distance reached")
	
    if enemySpawned == false {
        // Spawn an enemy object
		show_debug_message("Grunt spawn")
        instance_create_layer(x, y, "Deadite", enemyObjectType);
		enemySpawned = true
    }
}