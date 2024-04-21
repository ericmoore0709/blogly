-- Drop the tables entirely.
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;
-- Create the tables
CREATE TABLE users (
    id SERIAL NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    image_url VARCHAR NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE posts (
    id SERIAL NOT NULL,
    title VARCHAR NOT NULL,
    content VARCHAR NOT NULL,
    created_at DATE NOT NULL,
    author_id INTEGER,
    PRIMARY KEY (id),
    FOREIGN KEY(author_id) REFERENCES users (id)
);
-- Add dummy data to users table
INSERT INTO users (id, first_name, last_name, image_url)
VALUES (
        1,
        'Vanya',
        'Cranton',
        'http://dummyimage.com/191x100.png/cc0000/ffffff'
    );
INSERT INTO users (id, first_name, last_name, image_url)
VALUES (
        2,
        'Cecil',
        'Frend',
        'http://dummyimage.com/187x100.png/ff4444/ffffff'
    );
INSERT INTO users (id, first_name, last_name, image_url)
VALUES (
        3,
        'Mohammed',
        'Bannester',
        'http://dummyimage.com/200x100.png/dddddd/000000'
    );
INSERT INTO users (id, first_name, last_name, image_url)
VALUES (
        4,
        'Eliza',
        'Humbey',
        'http://dummyimage.com/113x100.png/dddddd/000000'
    );
INSERT INTO users (id, first_name, last_name, image_url)
VALUES (
        5,
        'Friederike',
        'Wynne',
        'http://dummyimage.com/191x100.png/5fa2dd/ffffff'
    );
INSERT INTO users (id, first_name, last_name, image_url)
VALUES (
        6,
        'Nessie',
        'Rimbault',
        'http://dummyimage.com/140x100.png/5fa2dd/ffffff'
    );
INSERT INTO users (id, first_name, last_name, image_url)
VALUES (
        7,
        'Waverley',
        'McGuinley',
        'http://dummyimage.com/163x100.png/5fa2dd/ffffff'
    );
INSERT INTO users (id, first_name, last_name, image_url)
VALUES (
        8,
        'Kym',
        'Willoughley',
        'http://dummyimage.com/202x100.png/5fa2dd/ffffff'
    );
INSERT INTO users (id, first_name, last_name, image_url)
VALUES (
        9,
        'Aurelea',
        'Summerlie',
        'http://dummyimage.com/137x100.png/dddddd/000000'
    );
INSERT INTO users (id, first_name, last_name, image_url)
VALUES (
        10,
        'Annelise',
        'Fahrenbacher',
        'http://dummyimage.com/188x100.png/dddddd/000000'
    );
-- Add dummy data to posts table
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        1,
        'vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere',
        'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.',
        '8/14/2023',
        4
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        2,
        'rutrum neque aenean auctor gravida sem praesent id massa id nisl',
        'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.',
        '7/18/2023',
        7
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        3,
        'nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac',
        'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.

Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',
        '9/6/2023',
        9
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        4,
        'eget eros elementum pellentesque quisque porta volutpat erat quisque erat eros viverra',
        'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.',
        '3/28/2024',
        5
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        5,
        'convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis',
        'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.',
        '9/5/2023',
        10
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        6,
        'primis in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam vitae quam',
        'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.

In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.',
        '1/3/2024',
        7
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        7,
        'venenatis lacinia aenean sit amet justo morbi ut odio cras mi pede malesuada in imperdiet et commodo vulputate justo',
        'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.',
        '5/29/2023',
        7
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        8,
        'gravida sem praesent id massa id nisl venenatis lacinia aenean sit amet justo morbi',
        'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.',
        '5/13/2023',
        10
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        9,
        'sollicitudin vitae consectetuer eget rutrum at lorem integer tincidunt ante vel ipsum',
        'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.

Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.

Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.',
        '8/8/2023',
        9
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        10,
        'orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat',
        'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',
        '4/20/2024',
        4
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        11,
        'urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat',
        'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.',
        '6/12/2023',
        5
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        12,
        'est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id',
        'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.',
        '10/17/2023',
        3
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        13,
        'dui maecenas tristique est et tempus semper est quam pharetra magna ac consequat metus',
        'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.

Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
        '4/15/2024',
        7
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        14,
        'vivamus in felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor turpis nec euismod',
        'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',
        '4/25/2023',
        5
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        15,
        'felis eu sapien cursus vestibulum proin eu mi nulla ac enim in tempor',
        'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.

Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',
        '5/8/2023',
        8
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        16,
        'natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis',
        'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.

Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.',
        '6/19/2023',
        5
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        17,
        'eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero',
        'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.

Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.

Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',
        '5/23/2023',
        5
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        18,
        'phasellus id sapien in sapien iaculis congue vivamus metus arcu',
        'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.

Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.',
        '9/11/2023',
        1
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        19,
        'pulvinar sed nisl nunc rhoncus dui vel sem sed sagittis nam congue risus',
        'Fusce consequat. Nulla nisl. Nunc nisl.',
        '12/20/2023',
        4
    );
INSERT INTO posts (id, title, content, created_at, author_id)
VALUES (
        20,
        'ultrices libero non mattis pulvinar nulla pede ullamcorper augue a suscipit nulla elit',
        'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.',
        '10/5/2023',
        1
    );
-- update users table id primary key start
SELECT setval(
        'users_id_seq',
        (
            SELECT MAX(id)
            FROM users
        ) + 1
    );
-- update posts table id primary key start
SELECT setval(
        'posts_id_seq',
        (
            SELECT MAX(id)
            FROM posts
        ) + 1
    );