import 'package:flutter/material.dart';
import 'package:gerphis_game/core/constants/colors.dart';

List<Category> categories = [
  Category(
    difficulty: "Easy",
    category: "Officials",
    displayColor: MyColors.moss,
    hintCount: 6,
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
    hintCount: 4,
    items: [
      (
        word: 'ARELLANO HIGH SCHOOL',
        hint: 'It is one of the oldest public schools in Manila',
        fact:
            'Arellano High School was formerly known as Manila North High School before being renamed in 1930 in honor of Cayetano S. Arellano, the first Filipino Chief Justice of the Supreme Court.',
      ),
      (
        word: 'UNIBERSIDAD NG PILIPINAS',
        hint: 'Top 1 University in the Philippines',
        fact:
            'UP was created by Act No. 1870 on June 18, 1908, but its College of Medicine actually predates the university: it began as the Philippine Medical School in 1905.',
      ),
      (
        word: 'DE LA SALLE UNIVERSITY',
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
    hintCount: 6,
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
            'Admiral Isoroku Yamamoto, the operation\'s principal architect, had previously lived in the United States as a naval attaché and traveled widely on a modest stipend.',
      ),
      (
        word: 'BATAAN',
        hint: 'Pivotal role in World War II',
        fact:
            'Bataan Technology Park in Morong was once the Philippine Refugee Processing Center, which sheltered roughly 400,000 refugees from Vietnam, Laos, and Cambodia over 14 years.',
      ),
      (
        word: 'WASHINGTON DC',
        hint: 'The capital of the USA',
        fact:
            'D.C. is not a state, but it is more populous than several states and has its own local government, mayor, and council.',
      ),
      (
        word: 'INTRAMUROS',
        hint: 'Center of Spanish colonial rule in the Philippines',
        fact:
            'Intramuros was enclosed by walls with seven gates, each serving different purposes such as trade, military access, religious processions, and movement between the walled city and surrounding districts.',
      ),
      (
        word: 'RIZAL PARK',
        hint: 'Where the Rizal Monument is',
        fact:
            'The monument\'s design was selected through an international competition; the winning design came from Swiss sculptor Richard Kissling.',
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
    hintCount: 4,

    items: [
      (word: 'OSROX MISSION', hint: 'N/A - hint', fact: 'N/A - fact'),
      (word: 'HARE HAWES CUTTING BILL', hint: 'N/A - hint', fact: 'N/A - fact'),
      (word: 'TYDINGS MCDUFFIE ACT', hint: 'N/A - hint', fact: 'N/A - fact'),
      (word: 'JONES LAW', hint: 'N/A - hint', fact: 'N/A - fact'),
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
