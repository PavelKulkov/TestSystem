package ru.kulkov.testsystem;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by Pavel Kulkov on 24.03.2016.\
 * Класс описывающий тест.
 */
public class Test {
    /**
     * Метод для получения вопросов теста из файла
     * @param testPath Путь к файлу с тестом.
     * @return Список вопросов.
     * @throws IOException Если не найден файл.
     */
    public static ArrayList<String> getQuestions(String testPath) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(testPath));

        ArrayList<String> questions = new ArrayList<String>();
        String line;

        while ((line = reader.readLine())!= null){
            //Если первый символ Q(подробнее в Tags.txt), то это вопрос
            if(line.charAt(0) == 'Q' ){
                questions.add(line.substring(2));
            }
        }
        reader.close();
        return questions;
    }

    /**
     * Метод для получения ответов теста из файла.
     * @param testPath Путь к файлу с тестом.
     * @return Список ответов.
     * @throws IOException Если не найден файл.
     */
    public static ArrayList<String> getAnswers(String testPath) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(testPath));

        ArrayList<String> answers = new ArrayList<String>();
        String line;
        String tmp="";
        String NA="";

        while ((line = reader.readLine())!= null){
            //Если первый символ A(Подробнее в Tags.txt), то это ответ
            if(line.substring(0,2).equals("NA")){
                NA = line.substring(3);
            }
            if(line.charAt(0) == 'A') {
                tmp += line.substring(1)+"%%";
            }
            if((line.charAt(0) == 'Q' && tmp != "") || line.substring(0,3).equals("END")){
                tmp+=NA;
                answers.add(tmp);
                tmp ="";
            }
        }
        reader.close();
        return answers;
    }

    /**
     * Метод для получения названия теста.
     * @param testPath Путь к файлу с тестом.
     * @return Название Теста.
     * @throws IOException Если не найден файл.
     */
    public static String getTestName(String testPath) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(testPath));

        String line;
        String testName="";
        while ((line = reader.readLine()) != null){
            //Если первые два символа TN(подробнее Tags.txt), то это название теста
            if(line.substring(0,2).equals("TN")){
                testName = line.substring(2);
                break;
            }
        }
        reader.close();
        return testName;
    }
}
