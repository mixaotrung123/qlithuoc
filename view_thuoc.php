<?php include('Connect_DB.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Xem thuốc</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Xem thuốc</h1>
    <table>
        <tr>
            <th>Mã thuốc</th>
            <th>Tên thuốc</th>
            <th>Mã công ty</th>
            <th>Mã nhóm thuốc</th>
            <th>Ngày sản xuất</th>
            <th>Hạn sử dụng</th>
            <th>Số lượng</th>
            <th>Đơn vị tính</th>
            <th>Giá thuốc</th>
        </tr>
        <?php
        $sql = "SELECT * FROM thuoc";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["MATHUOC"] . "</td>";
                echo "<td>" . $row["TENTHUOC"] . "</td>";
                echo "<td>" . $row["MACONGTY"] . "</td>";
                echo "<td>" . $row["MANHOMTHUOC"] . "</td>";
                echo "<td>" . $row["NSX"] . "</td>";
                echo "<td>" . $row["HSD"] . "</td>";
                echo "<td>" . $row["SOLUONG"] . "</td>";
                echo "<td>" . $row["DONVITINH"] . "</td>";
                echo "<td>" . $row["GIATHUOC"] . "</td>";
                echo "</tr>";
            }
        } else {
            echo "<tr><td colspan='9'>Không có thuốc nào</td></tr>";
        }
        ?>
    </table>
</body>
</html>
