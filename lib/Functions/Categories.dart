import 'package:flutter/material.dart';
import 'package:gerphis_game/core/constants/colors.dart';

List<Category> categories = [
  Category(
    difficulty: "Easy",
    category: "Officials",
    displayColor: MyColors.moss,
    items: [
      (
        word: 'MANUEL QUEZON',
        hint: 'A city in Metro Manila named after him',
        fact:
            'During the Japanese occupation, President Quezon led the Philippine Commonwealth Government-in-Exile in Washington, D.C., where he continued to represent the Philippines until his death in 1944.',
      ),
      (
        word: 'SERGIO OSMEÑA',
        hint: 'He served the shortest term as President',
        fact:
            'Sergio Osmeña and Manuel Roxas led the OsRox Mission in 1931, which secured the Hare-Hawes-Cutting Act in 1933, the first US law to set a definite timeline for Philippine independence.',
      ),
      (
        word: 'MANUEL ROXAS',
        hint: 'Last President of the Commonwealth Government',
        fact:
            'Manuel Roxas was one of the members of the Constitutional Convention that drafted the 1935 Constitution.',
      ),
      (
        word: 'WILLIAM HOWARD TAFT',
        hint: 'An avenue is named after him',
        fact:
            'William Howard Taft was the first American Civil Governor of the Philippines.',
      ),
      (
        word: 'FRANCIS BURTON HARRISON',
        hint: 'A street was named after him',
        fact:
            'Francis Burton Harrison was a former American Governor-General of the Philippines and the first American to acquire Filipino citizenship through a special act in 1936.',
      ),
      (
        word: 'DOUGLAS MACARTHUR',
        hint: 'Famous quote: "I shall return"',
        fact:
            'Douglas MacArthur made his famous promise, "I shall return," during World War II after leaving the Philippines, to assure Filipinos and the soldiers left behind that he intended to come back and help free the country.',
      ),
    ],
  ),
  Category(
    difficulty: "Easy",
    category: "Schools",
    displayColor: MyColors.moss,
    items: [
      (
        word: 'ARELLANO HIGH SCHOOL',
        hint: 'It is one of the oldest public schools in Manila',
        fact:
            'Arellano High School was formerly known as Manila North High School before being renamed in 1930 in honor of Cayetano S. Arellano, the first Filipino Chief Justice of the Supreme Court.',
      ),
      (
        word: 'UNIBERSIDAD NG PILIPINAS',
        hint: 'The national university of the Philippines',
        fact:
            'The University of the Philippines was established in 1908 through Act No. 1870 of the Philippine Legislature.',
      ),
      (
        word: 'DE LA SALLE UNIVERSITY',
        hint: 'It was built during the American period, not Spanish.',
        fact:
            'During the Battle of Manila in 1945, De La Salle College became a refuge for Filipino families and Christian Brothers escaping the war. However, on February 12, Japanese soldiers stormed the campus and massacred 41 people, including 16 Christian Brothers and 25 civilians.',
      ),
      (
        word: 'SAN BEDA UNIVERSITY',
        hint: 'Its sports teams are called the Red Lions',
        fact:
            'San Beda was founded in Manila in 1901 by Benedictine monks and is named after Saint Bede the Venerable, an English monk.',
      ),
    ],
  ),
  Category(
    difficulty: "Medium",
    category: "Places",
    displayColor: MyColors.amber,
    items: [
      (
        word: 'MANILA',
        hint: 'N/A - hint',
        fact:
            'During World War II, Manila was declared an "Open City" on December 26, 1941, by General Douglas MacArthur to prevent further destruction and protect its civilian population from the advancing Japanese forces. Despite this declaration, Japanese forces continued bombing the city and eventually occupied it on January 2, 1942.',
      ),
      (word: 'PEARL HARBOR', hint: 'N/A - hint', fact: 'N/A - fact'),
      (word: 'BATAAN', hint: 'N/A - hint', fact: 'N/A - fact'),
      (word: 'WASHINGTON DC', hint: 'N/A - hint', fact: 'N/A - fact'),
      (word: 'INTRAMUROS', hint: 'N/A - hint', fact: 'N/A - fact'),
      (word: 'RIZAL PARK', hint: 'N/A - hint', fact: 'N/A - fact'),
    ],
  ),
  Category(
    difficulty: "Hard",
    category: "Policies",
    displayColor: MyColors.brick,
    items: [
      (
        word: 'NATIONAL DEFENSE ACT',
        hint: 'Reserve Officers\' Training Corps (ROTC)',
        fact: 'N/A - fact',
      ),
      (
        word: 'SUFFRAGE FOR WOMEN',
        hint: 'N/A - hint',
        fact:
            'The Philippines was one of the first Asian countries to allow the right for women to vote.',
      ),
      (
        word: 'NATIONAL LANGUAGE POLICY',
        hint: 'N/A - hint',
        fact: 'N/A - fact',
      ),
    ],
  ),
  Category(
    difficulty: "Very Hard",
    category: "Mission for Independence",
    displayColor: MyColors.blood,
    items: [
      (word: 'OSROX MISSION', hint: 'N/A - hint', fact: 'N/A - fact'),
      (word: 'HARE HAWES CUTTING BILL', hint: 'N/A - hint', fact: 'N/A - fact'),
      (word: 'TYDINGS-MCDUFFIE ACT', hint: 'N/A - hint', fact: 'N/A - fact'),
      (word: 'JONES LAW', hint: 'N/A - hint', fact: 'N/A - fact'),
    ],
  ),
];

class Category {
  final String difficulty;
  final String category;
  final Color displayColor;

  final List<({String word, String hint, String fact})> items;

  Category({
    required this.difficulty,
    required this.category,
    required this.displayColor,
    required this.items,
  });
}
