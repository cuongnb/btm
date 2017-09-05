"""
Created : 24/03/2017
@author : Cuong Nguyen Ba
"""
import os
import sys

from datetime import datetime

import shutil

from common import utilities

all_dataset_dir = 'dataset'
all_dataset = {'twitter': 'tweet.txt.sf'}
all_mode = {'tp': 'topics', 'w': 'words'}
setting_file_name = 'settings.txt'
all_model_folder = 'models'


def main():
    # Check input
    if len(sys.argv) != 5:
        print "Usage: python run_perplexity [dataset_name] [infer_mode] [drop_rate] [path_pw_z]"
        exit()
    # Get environment variables
    dataset_name = sys.argv[1]
    drop_mode = sys.argv[2]
    drop_rate = sys.argv[3]
    path_pw_z = sys.argv[4]
    # End params

    # dataset_name = 'twitter'
    # drop_mode = 'tp'
    # drop_rate = 0.6

    dataset_dir = '/'.join([all_dataset_dir, dataset_name])
    train_file = '/'.join([dataset_dir, all_dataset[dataset_name]])
    setting_file = '/'.join([dataset_dir, setting_file_name])
    rate_name = str(drop_rate).replace('.', '')
    model_name = 'DropOBTM' + drop_mode + rate_name
    model_folder = '/'.join([dataset_dir, all_model_folder, model_name])
    divided_data_folder = dataset_dir
    infer_mode = all_mode[drop_mode]
    run_em(train_file, setting_file, model_folder, divided_data_folder, infer_mode, drop_rate, path_pw_z)


def run_em(train_file, setting_file, model_folder, divided_data_folder, infer_mode, drop_rate, path_pw_z):
    tops = 20

    print 'Perform DropOBTM with mode ', infer_mode, ' and rate = ', drop_rate, ' in ', train_file
    print datetime.now()

    # read settings
    print '\treading setting ...'
    ddict = utilities.read_setting(setting_file)

    if os.path.exists(model_folder):
        shutil.rmtree(model_folder)
    os.makedirs(model_folder)

    # insert to settings
    ddict['drop_rate'] = drop_rate
    ddict['infer_mode'] = infer_mode

    # write settings
    print '\t write settings ...'
    file_name = '%s/setting.txt' % model_folder
    utilities.write_setting(ddict, file_name)

    # data for computing perplexities
    print '\tread data for computing perplexities ...'
    (corpusids_part1, corpuscts_part1, corpusids_part2, corpuscts_part2) = \
        utilities.read_data_for_perpl(divided_data_folder)

    # compute_perplexities
    n_day = 294
    for n in range(n_day):
        # print'\n\t***ite    r_train**\n' %n
        file_pwz = '/'.join([path_pw_z, 'k'+str(ddict['num_topics'])+'.day' + str(n) + '.pw_z'])
        # print file_pwz
        beta = utilities.read_Pw_z(file_pwz, ddict['num_topics'], ddict['num_terms'])
        (LD2, ld2_list) = utilities.compute_perplexities_vb(beta, ddict['alpha'], ddict['eta'],
                                                            ddict['iter_infer'], corpusids_part1,
                                                            corpuscts_part1, corpusids_part2,
                                                            corpuscts_part2)
        list_tops = []
        batch_no = 0
        theta = []
        time_e = 0
        time_m = 0
        # write files
        utilities.write_file(n, batch_no, beta, theta, time_e, time_m, model_folder, LD2, ld2_list,
                             list_tops, tops)


if __name__ == '__main__':
    main()
