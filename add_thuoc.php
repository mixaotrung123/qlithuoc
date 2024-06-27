<?php include('Connect_DB.php'); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý thuốc</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function showTab(tabId) {
            var tabs = document.getElementsByClassName('tab-content');
            for (var i = 0; i < tabs.length; i++) {
                tabs[i].style.display = 'none';
            }
            document.getElementById(tabId).style.display = 'block';
        }

        function handleViewClick(event) {
            event.preventDefault();
            showTab('tab-view');
        }
    </script>
</head>
<body onload="showTab('tab-add')">
    <h1>Quản lý thuốc</h1>
    <nav class="menu">
        <ul>
            <li><a href="#" onclick="showTab('tab-add')">Thêm thuốc</a></li>
            <li><a href="#" onclick="showTab('tab-view')">Xem thuốc</a></li>
        </ul>
    </nav>

    <div id="tab-add" class="tab-content">
        <h2>Thêm thuốc</h2>
        <form action="" method="post">
            <label for="MATHUOC">Mã thuốc:</label>
            <input type="text" id="MATHUOC" name="MATHUOC" required><br>

            <label for="TENTHUOC">Tên thuốc:</label>
            <input type="text" id="TENTHUOC" name="TENTHUOC" required><br>

            <label for="MACONGTY">Mã công ty:</label>
            <input type="text" id="MACONGTY" name="MACONGTY" required><br>

            <label for="MANHOMTHUOC">Mã nhóm thuốc:</label>
            <input type="text" id="MANHOMTHUOC" name="MANHOMTHUOC" required><br>

            <label for="NSX">Ngày sản xuất:</label>
            <input type="date" id="NSX" name="NSX" required><br>

            <label for="HSD">Hạn sử dụng:</label>
            <input type="date" id="HSD" name="HSD" required><br>

            <label for="SOLUONG">Số lượng:</label>
            <input type="number" id="SOLUONG" name="SOLUONG" required><br>

            <label for="DONVITINH">Đơn vị tính:</label>
            <input type="text" id="DONVITINH" name="DONVITINH" required><br>

            <label for="GIATHUOC">Giá thuốc:</label>
            <input type="number" id="GIATHUOC" name="GIATHUOC" required><br>

            <input type="submit" name="submit" value="Thêm">
            <input type="button" value="Xem thuốc" onclick="handleViewClick(event)">
        </form>

        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['submit'])) {
            $MATHUOC = $_POST['MATHUOC'];
            $TENTHUOC = $_POST['TENTHUOC'];
            $MACONGTY = $_POST['MACONGTY'];
            $MANHOMTHUOC = $_POST['MANHOMTHUOC'];
            $NSX = $_POST['NSX'];
            $HSD = $_POST['HSD'];
            $SOLUONG = $_POST['SOLUONG'];
            $DONVITINH = $_POST['DONVITINH'];
            $GIATHUOC = $_POST['GIATHUOC'];

            $sql = "INSERT INTO thuoc (MATHUOC, TENTHUOC, MACONGTY, MANHOMTHUOC, NSX, HSD, SOLUONG, DONVITINH, GIATHUOC) 
                    VALUES ('$MATHUOC', '$TENTHUOC', '$MACONGTY', '$MANHOMTHUOC', '$NSX', '$HSD', '$SOLUONG', '$DONVITINH', '$GIATHUOC')";

            if ($conn->query($sql) === TRUE) {
                echo "Thuốc đã được thêm thành công.";
            } else {
                echo "Lỗi: " . $sql . "<br>" . $conn->error;
            }
        }
        ?>
    </div>

    <div id="tab-view" class="tab-content">
        <h2>Xem thuốc</h2>
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
    </div>
</body>
</html>
