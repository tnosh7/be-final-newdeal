-- 데이터 삽입 전에 테이블을 비웁니다.
DELETE
FROM review_img;
DELETE
FROM review;
DELETE
FROM reservation;
DELETE
FROM guest;
DELETE
FROM host;

-- Guest 데이터 삽입
INSERT INTO guest (guestName, email, password, phone, role, join_dt, expire_dt, address, image, email_check_yn)
VALUES ('Guest1', 'guest1@example.com', 'password1', '010-1111-1111', 'GUEST', NOW(), NOW() + INTERVAL 7 DAY,
        'Address1', 'image1.jpg', 'N'),
       ('Guest2', 'guest2@example.com', 'password2', '010-2222-2222', 'GUEST', NOW(), NOW() + INTERVAL 7 DAY,
        'Address2', 'image2.jpg', 'N'),
       ('Guest3', 'guest3@example.com', 'password3', '010-3333-3333', 'GUEST', NOW(), NOW() + INTERVAL 7 DAY,
        'Address3', 'image3.jpg', 'N'),
       ('Guest4', 'guest4@example.com', 'password4', '010-4444-4444', 'GUEST', NOW(), NOW() + INTERVAL 7 DAY,
        'Address4', 'image4.jpg', 'N'),
       ('Guest5', 'guest5@example.com', 'password5', '010-5555-5555', 'GUEST', NOW(), NOW() + INTERVAL 7 DAY,
        'Address5', 'image5.jpg', 'N');

-- Host 데이터 삽입
INSERT INTO host (hostName, email, password, phone, role, join_dt, expire_dt, image, email_check_yn)
VALUES ('Host1', 'host1@example.com', 'password1', '010-1111-1111', 'HOST', NOW(), NOW() + INTERVAL 7 DAY, 'image1.jpg',
        'N'),
       ('Host2', 'host2@example.com', 'password2', '010-2222-2222', 'HOST', NOW(), NOW() + INTERVAL 7 DAY, 'image2.jpg',
        'N'),
       ('Host3', 'host3@example.com', 'password3', '010-3333-3333', 'HOST', NOW(), NOW() + INTERVAL 7 DAY, 'image3.jpg',
        'N'),
       ('Host4', 'host4@example.com', 'password4', '010-4444-4444', 'HOST', NOW(), NOW() + INTERVAL 7 DAY, 'image4.jpg',
        'N'),
       ('Host5', 'host5@example.com', 'password5', '010-5555-5555', 'HOST', NOW(), NOW() + INTERVAL 7 DAY, 'image5.jpg',
        'N');

-- Accommodation 데이터 삽입 (예제에서는 host 테이블의 존재를 가정하고 있음)
INSERT INTO accommodation (host_id, accomm_name, accomm_category, room_category, address, detail_address, max_guests,
                           accomm_price, check_in, check_out, accomm_content, rating, review_count, createdAt,
                           latitude, longitude)
VALUES (1, 'Accommodation 1', 'Hotel', 'Single Room', '123 Main St', 'Apt 1', 2, '100.00', '14:00', '12:00',
        'A cozy single room.', 4.5, 10, NOW(), 37.7749, -122.4194),
       (2, 'Accommodation 2', 'Hostel', 'Dormitory', '456 Elm St', 'Room 2', 6, '50.00', '15:00', '11:00',
        'A dormitory for budget travelers.', 3.8, 20, NOW(), 34.0522, -118.2437),
       (3, 'Accommodation 3', 'Apartment', 'Two Bedroom', '789 Oak St', 'Suite 3', 4, '150.00', '16:00', '10:00',
        'A spacious two-bedroom apartment.', 4.0, 15, NOW(), 40.7128, -74.0060),
       (4, 'Accommodation 4', 'Guesthouse', 'Studio', '101 Pine St', 'Bungalow', 2, '80.00', '13:00', '11:00',
        'A quaint studio guesthouse.', 4.2, 8, NOW(), 51.5074, -0.1278),
       (5, 'Accommodation 5', 'Villa', 'Three Bedroom', '202 Birch St', 'House', 6, '200.00', '15:00', '12:00',
        'A luxurious three-bedroom villa.', 4.7, 5, NOW(), 48.8566, 2.3522);
-- Reservation 데이터 삽입 (예제에서는 accommodation과 guest 테이블의 존재를 가정하고 있음)
-- Accommodation 데이터는 미리 삽입되어 있어야 합니다.
INSERT INTO reservation (accomm_id, guest_id, check_in_date, check_out_date, guests, created_at, message)
VALUES (1, 1, '2024-07-20', '2024-07-25', 2, NOW(), 'Message 1'),
       (2, 2, '2024-07-21', '2024-07-26', 3, NOW(), 'Message 2'),
       (3, 3, '2024-07-22', '2024-07-27', 1, NOW(), 'Message 3'),
       (4, 4, '2024-07-23', '2024-07-28', 4, NOW(), 'Message 4'),
       (5, 5, '2024-07-24', '2024-07-29', 2, NOW(), 'Message 5');

-- Review 데이터 삽입 (예제에서는 accommodation과 reservation 테이블의 존재를 가정하고 있음)
INSERT INTO review (reservation_id, star, content, created_at, accomm_id)
VALUES (1, 5, 'Excellent stay!', NOW(), 1),
       (2, 4, 'Very good experience', NOW(), 2),
       (3, 3, 'Average service', NOW(), 3),
       (4, 2, 'Not as expected', NOW(), 4),
       (5, 1, 'Terrible stay!', NOW(), 5);

-- ReviewImg 데이터 삽입 (예제에서는 review 테이블의 존재를 가정하고 있음)
INSERT INTO review_img (review_id, img_url, created_at)
VALUES (1, 'https://cdn.3hoursahead.com/v2/content/image-comp/f3c4505d-6bbe-481a-9b8a-be713e8b196f.webp', NOW()),
       (2, 'https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/wlQ/image/sDpK8gWt1h_7iJrDw9wTBWcixtU.jpg', NOW()),
       (3, 'https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473511746848033.jpg', NOW()),
       (4, 'https://tourimage.interpark.com/BBS/Tour/FckUpload/202009/6373473199034434680.jpg', NOW()),
       (5, 'https://cdn.3hoursahead.com/v2/content/image-comp/0e12e7c9-3ced-403e-a5cb-de281e1e7902.webp', NOW());
