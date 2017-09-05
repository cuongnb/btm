#include <cstdlib>
#include <string>
#include <iostream>
#include <ctime>

#include "str_util.h"
#include "obtm.h"
#include "ibtm.h"
#include "infer.h"

using namespace std;

int writeFile(int n_topic, int size_vocab, int n_day, double alpha,
              double beta, double lam, double time, string res_dir) {
    ofstream myfile;
    myfile.open(res_dir + "setting.txt");
    myfile << "Number of Topic: " << n_topic << '\n';
    myfile << "Size of Voca: " << size_vocab << '\n';
    myfile << "Number of day: " << n_day << '\n';
    myfile << "alpha: " << alpha << '\n';
    myfile << "beta: " << beta << '\n';
    myfile << "lam: " << lam << '\n';
    myfile << "Time taken: " << time << "s\n";
    myfile.close();
    return 0;
}

int hmain(int argc, char *argv[]) {
    int i = 1;
    string method("obtm");
    int K = 50;
    int W = 89474;
    double alpha = 1.0;
    double beta = 0.01;
    string input_dir("../output/doc_wids/");
    int n_day = 294;
    string res_dir("../output/model/");

    printf("=== %s: end_day %d , K %d, W %d, alpha %f, beta %f ====\n",
           method.c_str(), n_day, K, W, alpha, beta);

    // model-sepcific parameters
    if (method == "obtm") {
//        int n_iter = atoi(argv[i++]);
//        double lam = atof(argv[i++]);
        int n_iter = 1;
        double lam = 1;
        printf("Model=obtm, n_iter=%d, lam=%f\n", n_iter, lam);
        OBTM mod(K, W, alpha, beta, n_iter, lam, 0.5, 0);

        //[BEGIN calculating execution for run model]
        clock_t tStart = clock();
        mod.run(input_dir, n_day, res_dir);
        double del_time = (double) (clock() - tStart) / CLOCKS_PER_SEC;
        writeFile(K, W, n_day, alpha, beta, lam, del_time, res_dir);
        printf("Time taken: %.2fs\n", del_time);
        //[END calculating]

    } else if (method == "ibtm") {
        int win = atoi(argv[i++]);
        int n_rej = atoi(argv[i++]);
        printf("Model=ibtm, win=%d, n_rej=%d\n", win, n_rej);
        IBTM mod(K, W, alpha, beta, win, n_rej);
        mod.run(input_dir, n_day, res_dir);
    } else {
        cout << "Unrecognized method:" << argv[1] << endl;
        exit(-1);
    }

    string type("sum_b");
    for (int day = 0; day < n_day; day += 10) {
        string docs_pt(input_dir);
        std::string s = std::to_string(day);
        docs_pt += s + ".txt";
        cout << "----- Run inference:K=" << K << ", day=" << day << ", type " << type << " -----" << endl;
        Infer inf(type, K, day);
        inf.run(docs_pt, res_dir);
    }
}


int main(int argc, char *argv[]) {
    int i = 1;
    string method(argv[i++]);
    // common parameters
    int K = atoi(argv[i++]);          // topic number
    int W = atoi(argv[i++]);            // vocabulary size
    double alpha = atof(argv[i++]);   // hyperparameters of p(z)
    double beta = atof(argv[i++]);    // hyperparameters of p(w|z)
    string input_dir(argv[i++]);
    int n_day = atoi(argv[i++]);    //
    string res_dir(argv[i++]);
    printf("=== %s: end_day %d , K %d, W %d, alpha %f, beta %f ====\n",
           method.c_str(), n_day, K, W, alpha, beta);

    // model-sepcific parameters
    if (method == "obtm") {
        int n_iter = atoi(argv[i++]);
        double lam = atof(argv[i++]);
        double r_drop = atof(argv[i++]);
        int t_drop = atoi(argv[i++]);
        printf("Model=obtm, n_iter=%d, lam=%f, r_drop=%f, t_drop=%d\n", n_iter, lam, r_drop, t_drop);
        // todo add time clock and write file setting
        //[BEGIN calculating execution for run model]
        OBTM mod(K, W, alpha, beta, n_iter, lam, r_drop, t_drop);

        clock_t tStart = clock();
        mod.run(input_dir, n_day, res_dir);
        double del_time = (double) (clock() - tStart) / CLOCKS_PER_SEC;

        writeFile(K, W, n_day, alpha, beta, lam, del_time, res_dir);
        printf("Time taken: %.2fs\n", del_time);
        //[END calculating]

    } else if (method == "ibtm") {
        int win = atoi(argv[i++]);
        int n_rej = atoi(argv[i++]);
        printf("Model=ibtm, win=%d, n_rej=%d\n", win, n_rej);
        IBTM mod(K, W, alpha, beta, win, n_rej);
        mod.run(input_dir, n_day, res_dir);
    } else {
        cout << "Unrecognized method:" << argv[1] << endl;
        exit(-1);
    }

/*
    # ## infer p(z|d) for each doc
    echo "================ Infer P(z|d)==============="
    for day in `seq 0 $[$n_day-1]`; do
        dwid_pt=${dwid_dir}${day}.txt
    echo "../src/infer sum_b $K $day $dwid_pt $model_dir"
         ../src/infer sum_b $K $day $dwid_pt $model_dir
    done */
    //    string type(argv[1]);
    //    int K = atoi(argv[2]);                  // topic num
    //    int day = atoi(argv[3]);
    //    string docs_pt(argv[4]);
    //    string dir(argv[5]);
    // [BEGIN INFER]
    string type(argv[i++]);
    for (int day = 0; day < n_day; day += 10) {
        string docs_pt(input_dir);
        std::string s = std::to_string(day);
        docs_pt += s + ".txt";
        cout << "----- Run inference:K=" << K << ", day=" << day << ", type " << type << " -----" << endl;
        Infer inf(type, K, day);
        inf.run(docs_pt, res_dir);
    }
}
