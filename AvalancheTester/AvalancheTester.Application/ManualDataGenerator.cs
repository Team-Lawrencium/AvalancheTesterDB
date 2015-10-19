﻿using System;

namespace AvalancheTester.Application
{
    public class ManualDataGenerator
    {
        public void GenerateData()
        {
            var db = new AvalancheTestsDbEntities();

            using (db)
            {
                //var tests = db.Tests.Where(t => t.TetsId == 2).FirstOrDefault();

                Place vitosha = new Place()
                {
                    PlaceId = 1,
                    Name = "Vitosha"
                };
                db.Places.Add(vitosha);

                Place pirin = new Place()
                {
                    PlaceId = 2,
                    Name = "Pirin"
                };
                db.Places.Add(pirin);

                Place rila = new Place()
                {
                    PlaceId = 3,
                    Name = "Rila"
                };
                db.Places.Add(rila);

                User ivan = new User()
                {
                    UserId = 1,
                    Name = "Бай Иван Хижаря"
                };
                db.Users.Add(ivan);

                User petar = new User()
                {
                    UserId = 2,
                    Name = "Петър Попангелов",
                };
                db.Users.Add(petar);

                Organization rilaSport = new Organization()
                {
                    OrganisationId = 1,
                    Name = "Рила Спорт"
                };
                rilaSport.Users.Add(petar);
                db.Organizations.Add(rilaSport);

                Organization hutAleko = new Organization()
                {
                    OrganisationId = 2,
                    Name = "Хижа Алеко"
                };
                hutAleko.Users.Add(ivan);
                db.Organizations.Add(hutAleko);

                Test ivanTest = new Test()
                {
                    TetsId = 1,
                    TestResults = "Компресионен тест 3 повторения: Слой 163-120 см. – СТ1, СТ3...",
                    DangerLevel = 3,
                    PlaceId = 1,
                    UserId = 1,
                    Date = new DateTime(2015, 1, 12),
                    Slope = 27.5f,

                };
                ivanTest.Organizations.Add(hutAleko);
                db.Tests.Add(ivanTest);

                Test petarTest = new Test()
                {
                    TetsId = 2,
                    TestResults = "Компресионен тест 2 повторения: Слой 154-120 см. – СТ1, СТ3...",
                    DangerLevel = 2,
                    PlaceId = 3,
                    UserId = 2,
                    Date = new DateTime(2015, 1, 12),
                    Slope = 27.5f
                };
                petarTest.Organizations.Add(rilaSport);
                db.Tests.Add(petarTest);

                db.SaveChanges();
            }
        }
    }
}