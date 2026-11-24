import 'package:flutter/material.dart';
import 'package:gerphis_game/core/constants/colors.dart';

List<Category> categories = [
  Category(
    difficulty: "Easy",
    category: "Officials",
    displayColor: MyColors.moss,
    hintCount: 3,
    items: [
      (
        word: 'MANUEL QUEZON',
        hint: 'A city in Manila named after him',
        fact:
            'During the Japanese occupation, President Quezon led the Philippine Commonwealth Government-in-Exile in Washington, D.C., where he continued to represent the Philippines until his death in 1944.',
      ),
      (
        word: 'SERGIO OSMEÑA',
        hint: 'He served the shortest term as President',
        fact:
            'Sergio Osmeña and Manuel Roxas led the OsRox Mission in 1931, which successfully secured the Hare-Hawes-Cutting Act in 1933, the first US law to establish a definite timeline for Philippine independence.',
      ),
      (
        word: 'FRANCIS BURTON HARRISON',
        hint: 'A street was named after him',
        fact:
            'Francis Burton Harrison was a former American Civil Governor-General of the Philippines and the first American to acquire Filipino citizenship through a special act in 1936.',
      ),
      (
        word: 'DOUGLAS MACARTHUR',
        hint: 'Famous quote: "I shall return"',
        fact:
            'Douglas MacArthur made his famous promise, "I shall return," during World War II before leaving the Philippines. He said this to assure the Filipino people and soldiers he was leaving behind that he intended to return and help free the country.',
      ),
    ],
  ),
  Category(
    difficulty: "Easy",
    category: "Schools",
    displayColor: MyColors.moss,
    hintCount: 3,
    items: [
      (
        word: 'ARELLANO HIGH SCHOOL',
        hint: 'It is one of the oldest public schools in Manila',
        fact:
            'Arellano High School was formerly known as Manila North High School before being renamed in 1930 in honor of Cayetano S. Arellano, the first Filipino Chief Justice of the Supreme Court.',
      ),
      (
        word: 'UNIVERSITY OF THE PHILIPPINES',
        hint: 'Top 1 University in the Philippines',
        fact:
            'UP was created by Act No. 1870 on June 18, 1908, but its College of Medicine actually predates the university: it began as the Philippine Medical School in 1905.',
      ),
      (
        word: 'DE LA SALLE COLLEGE',
        hint: 'It was built during the American period, not Spanish.',
        fact:
            'During the Battle of Manila in 1945, De La Salle College became a refuge for Filipino families and Christian Brothers escaping the war. However, on February 12, Japanese soldiers stormed the campus and massacred 41 people, including 16 Christian Brothers and 25 civilians.',
      ),
      (
        word: 'SAN BEDA UNIVERSITY',
        hint: 'One of the known law schools',
        fact:
            'Despite its 1901 founding, San Beda was formally a college for most of its history; it became San Beda University in 2018 under Fr. Aloysius Maranan, who was the final rector-president of the college and the first president of the university.',
      ),
    ],
  ),
  Category(
    difficulty: "Medium",
    category: "Places",
    displayColor: MyColors.amber,
    hintCount: 3,
    items: [
      (
        word: 'MANILA',
        hint: 'The capital of the Philippines',
        fact:
            'During World War II, Manila was declared an "Open City" on December 26, 1941, by General Douglas MacArthur to prevent further destruction and protect its civilian population from the advancing Japanese forces. Despite this declaration, Japanese forces continued bombing the city towards its eventual occupancy on January 2, 1942.',
      ),
      (
        word: 'PEARL HARBOR',
        hint: 'US Navy Base and headquarters for the US Pacific Fleet',
        fact:
            'Although the attack on Pearl Harbor occurred on December 7, 1941, in Hawaii, Japan launched its attacks on the Philippines on December 8, 1941. This marked the beginning of the Japanese invasion of the Philippines.',
      ),
      (
        word: 'BATAAN',
        hint: 'Pivotal role in World War II',
        fact:
            'The Bataan Death March occurred in April 1942, when approximately 76,000 Filipino and American prisoners of war were forced by Japanese soldiers to march around 66 miles from Bataan to San Fernando before being transported to Capas and eventually Camp O\'Donnell.',
      ),
      (
        word: 'WASHINGTON DC',
        hint: 'The capital of the USA',
        fact:
            'During WWII, Washington, D.C. served as the center of the Philippine government in exile from 1942 to 1944.',
      ),
    ],
  ),
  Category(
    difficulty: "Hard",
    category: "Policies",
    displayColor: MyColors.brick,
    hintCount: 3,
    items: [
      (
        word: 'NATIONAL DEFENSE ACT',
        hint:
            'Reserve Officers\' Training Corps (ROTC): college based military training program',
        fact:
            'The National Defense Act of 1935 was created to prepare the Philippines for possible war and foreign invasion.',
      ),
      (
        word: 'SUFFRAGE FOR WOMEN',
        hint: 'The right to vote for women',
        fact:
            'The Philippines was one of the first Asian countries to allow the right for women to vote.',
      ),
      (
        word: 'NATIONAL LANGUAGE POLICY',
        hint: 'Filipino is our official language',
        fact:
            'President Manuel L. Quezon declared Tagalog as the basis of the Philippine national language in 1937 to promote unity and communication among Filipinos from different regions.',
      ),
      (
        word: 'ECONOMIC POLICY',
        hint: 'Concept of Free Trade',
        fact:
            'During the American colonial period and the Commonwealth era, Philippine products such as sugar, tobacco, and coconut products could enter the U.S. market with little or no tariffs, making it easier for Filipino exporters to sell their goods in America.',
      ),
    ],
  ),
  Category(
    difficulty: "Very Hard",
    category: "Mission for Independence",
    displayColor: MyColors.blood,
    hintCount: 3,
    items: [
      (
        word: 'OSROX MISSION',
        hint: 'Lobbying US Congress for Philippine independence',
        fact:
            'The OsRox Mission, led by Sergio Osmeña and Manuel Roxas in 1931, successfully secured the passage of the Hare-Hawes-Cutting Act in the United States in 1933.',
      ),
      (
        word: 'HARE HAWES CUTTING BILL',
        hint: 'First US law for Philippine independence',
        fact:
            'The Hare-Hawes-Cutting Act of 1933 was the first U.S. law to set a definite timetable for Philippine independence. It promised independence after a 10-year transition period, but was rejected by the Philippine Legislature because of controversial provisions, including the retention of American military and naval bases in the Philippines.',
      ),
      (
        word: 'TYDINGS MCDUFFIE ACT',
        hint: 'Setting the timeline and framework for Philippine independence',
        fact:
            'It established the 10-year transition period that led to Philippine independence in 1946.',
      ),
      (
        word: 'JONES LAW',
        hint: 'First fully elected Philippine legislature',
        fact:
            'It contained the first official U.S. legislative promise to recognize Philippine independence.',
      ),
    ],
  ),
];

class Category {
  final String difficulty;
  final String category;
  final Color displayColor;
  late int hintCount;

  final List<({String word, String hint, String fact})> items;

  Category({
    required this.difficulty,
    required this.category,
    required this.displayColor,
    required this.hintCount,
    required this.items,
  });
}
