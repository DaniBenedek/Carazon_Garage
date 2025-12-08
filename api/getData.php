<?php
// Enable CORS
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json');

// Handle preflight requests
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Database connection
$conn = new mysqli('localhost', 'root', '', 'carazongarage');

// Check connection
if ($conn->connect_error) {
    http_response_code(500);
    die(json_encode(['error' => 'Connection failed: ' . $conn->connect_error]));
}

// Query to get hero text from your database
$sql = "SELECT heroTitle, heroSubtitle, heroDescription FROM hero_content LIMIT 1";
$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    $row = $result->fetch_assoc();
    http_response_code(200);
    echo json_encode($row);
} else {
    // Return default values if table doesn't exist or is empty
    http_response_code(200);
    echo json_encode([
        'heroTitle' => 'Carazon Garage',
        'heroSubtitle' => 'Where Wood Transforms Into Timeless Masterpieces',
        'heroDescription' => 'Experience the fusion of traditional craftsmanship and contemporary artistry. Each piece tells a story carved with precision, passion, and decades of mastery.'
    ]);
}

$conn->close();
?>
