<?php
// Enable CORS
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json');

// Database connection
$conn = new mysqli('localhost', 'root', '', 'carazongarage');

$sql = "SELECT heroTitle, heroSubtitle, heroDescription FROM hero_content LIMIT 1";
$result = $conn->query($sql);

$conn->close();
?>
