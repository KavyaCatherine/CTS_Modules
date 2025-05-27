-- 1. User Upcoming Events
SELECT e.title, e.start_date, e.end_date
FROM Events e
JOIN Registrations r ON e.event_id = r.event_id
WHERE r.user_id = 1 AND e.start_date > CURDATE()
ORDER BY e.start_date;

-- 2. Top Rated Events
SELECT e.title, AVG(f.rating) AS avg_rating
FROM Events e
JOIN Feedback f ON e.event_id = f.event_id
GROUP BY e.event_id
HAVING COUNT(f.feedback_id) >= 10
ORDER BY avg_rating DESC;

-- 3. Inactive Users
SELECT u.full_name, u.email
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
WHERE r.registration_date < CURDATE() - INTERVAL 90 DAY OR r.registration_date IS NULL;

-- 4. Peak Session Hours
SELECT e.title, COUNT(s.session_id) AS session_count
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
WHERE TIME(s.start_time) BETWEEN '10:00:00' AND '12:00:00'
GROUP BY e.event_id;

-- 5. Most Active Cities
SELECT u.city, COUNT(DISTINCT r.user_id) AS active_users
FROM Users u
JOIN Registrations r ON u.user_id = r.user_id
GROUP BY u.city
ORDER BY active_users DESC
LIMIT 5;

-- 6. Event Resource Summary
SELECT e.title, 
       SUM(CASE WHEN r.resource_type = 'pdf' THEN 1 ELSE 0 END) AS pdf_count,
       SUM(CASE WHEN r.resource_type = 'image' THEN 1 ELSE 0 END) AS image_count,
       SUM(CASE WHEN r.resource_type = 'link' THEN 1 ELSE 0 END) AS link_count
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
GROUP BY e.event_id;

-- 7. Low Feedback Alerts
SELECT u.full_name, u.email, e.title, f.comments
FROM Feedback f
JOIN Users u ON f.user_id = u.user_id
JOIN Events e ON f.event_id = e.event_id
WHERE f.rating < 3;

-- 8. Sessions per Upcoming Event
SELECT e.title, COUNT(s.session_id) AS session_count
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE e.start_date > CURDATE()
GROUP BY e.event_id;

-- 9. Organizer Event Summary
SELECT u.full_name, COUNT(e.event_id) AS event_count,
       SUM(CASE WHEN e.status = 'upcoming' THEN 1 ELSE 0 END) AS upcoming_count,
       SUM(CASE WHEN e.status = 'completed' THEN 1 ELSE 0 END) AS completed_count,
       SUM(CASE WHEN e.status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled_count
FROM Users u
JOIN Events e ON u.user_id = e.organizer_id
GROUP BY u.user_id;

-- 10. Feedback Gap
SELECT e.title
FROM Events e
LEFT JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE r.registration_id IS NOT NULL AND f.feedback_id IS NULL;

-- 11. Daily New User Count
SELECT registration_date, COUNT(user_id) AS new_users
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date;

-- 12. Event with Maximum Sessions
SELECT e.title
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY e.event_id
ORDER BY COUNT(s.session_id) DESC
LIMIT 1;

-- 13. Average Rating per City
SELECT u.city, AVG(f.rating) AS avg_rating
FROM Users u
JOIN Feedback f ON u.user_id = f.user_id
JOIN Events e ON f.event_id = e.event_id
GROUP BY u.city;

-- 14. Most Registered Events
SELECT e.title, COUNT(r.registration_id) AS registration_count
FROM Events e
JOIN Registrations r ON e.event_id = r.event_id
GROUP BY e.event_id
ORDER BY registration_count DESC
LIMIT 3;

-- 15. Event Session Time Conflict
SELECT s1.event_id, s1.session_id AS session1, s2.session_id AS session2
FROM Sessions s1
JOIN Sessions s2 ON s1.event_id = s2.event_id
WHERE s1.session_id < s2.session_id
AND ((s1.start_time BETWEEN s2.start_time AND s2.end_time)
     OR (s2.start_time BETWEEN s1.start_time AND s1.end_time));

-- 16. Unregistered Active Users
SELECT u.full_name, u.email
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
WHERE u.registration_date >= CURDATE() - INTERVAL 30 DAY
AND r.registration_id IS NULL;

-- 17. Multi-Session Speakers
SELECT s.speaker_name, COUNT(s.session_id) AS session_count
FROM Sessions s
GROUP BY s.speaker_name
HAVING session_count > 1;

-- 18. Resource Availability Check
SELECT e.title
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
GROUP BY e.event_id
HAVING COUNT(r.resource_id) = 0;

-- 19. Completed Events with Feedback Summary
SELECT e.title, COUNT(r.registration_id) AS total_registrations, AVG(f.rating) AS avg_feedback
FROM Events e
JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id;

-- 20. User Engagement Index
SELECT u.user_id, COUNT(DISTINCT r.event_id) AS events_attended, COUNT(f.feedback_id) AS feedback_submitted
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
LEFT JOIN Feedback f ON u.user_id = f.user_id
GROUP BY u.user_id;

-- 21. Top Feedback Providers
SELECT u.full_name, COUNT(f.feedback_id) AS feedback_count
FROM Users u
JOIN Feedback f ON u.user_id = f.user_id
GROUP BY u.user_id
ORDER BY feedback_count DESC
LIMIT 5;

-- 22. Duplicate Registrations Check
SELECT r.user_id, r.event_id, COUNT(r.registration_id) AS duplicate_count
FROM Registrations r
GROUP BY r.user_id, r.event_id
HAVING duplicate_count > 1;

-- 23. Registration Trends
SELECT DATE_FORMAT(registration_date, '%Y-%m') AS month, COUNT(user_id) AS registrations
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 12 MONTH
GROUP BY month
ORDER BY month DESC;

-- 24. Average Session Duration per Event
SELECT e.title, AVG(TIMESTAMPDIFF(MINUTE, s.start_time, s.end_time)) AS avg_duration_minutes
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY e.event_id;

-- 25. Events
::contentReference[oaicite:0]{index=0}
 
