# Investigating-Sex-Based-Variations-in-Forearm-Electromyography

The participants recording files cannot be provided due to ethical considerations.

This repository contains various folders: 
  - Excel files: excel files containing the mean RMS muscle values of female.xlsx and male.xlsx particpants. The file results.xlsx contains the results of the Mann Whitney U test done using the values in the mentioned female and male tables.
  - Check function example figures: this folder contains the figures 19 - 24 of the Results Chapter.
  - Box plots: contains all the figures 31 - 40 of the Results Chapter.
  - Examples figures of Results Chapter: contains the figures 25 - 31.
  - Codes not used: this folder contains all the codes that were used at the start before I learnt how to code in Matlab, and spider graphs, which were not used in the main thesis body.

The rest of the files, which have the Matlab extension of .m or .mlx refer to the following: 
  - mvc.m: function used to obtain the normalisation factor of the muscle mvc.
  - rep.m, rep2.m, rep3.m: refer to the Mean_task function and its variations. rep2 and rep3 refer to the lack of one of those files, so the function was adapted to return the mean of the signal without such repetition.
  - checks_function.m, pwplotsnoed.m, pwplotsnrep: these refer to the Checks function used to check if all the recordings were taken. The variations refer to the function returning plots when no repetition file or no muscle were not recorded.
  - pw.m, pwed.m, pwecu.m, pwecr.m, pwfcr.m: these refer to the function used to calculate the mean of each position of the pour water task. It would also plot the signal a the end. The variations are for when a muscle file was not available.
  - force.mlx: It contains the values of the maximum grip strength test of the female and male groups. It performs the mean values of each group; plots the medians in a box plot, and does a Mann Whitney U Test to investigate any differences.
  - male.m and female.m: code used to obtain all the mean values of each muscle according to the task or position being holded using the functions above.
  - mannwhitney.m: function used to calculate the results for the hypothesis comparing the muscle groups of female and male participants.
  - mannwhitneyutest.m: code used to obtain the results using the previous function.
  - kruskalwallis_table.m: code used to calculate the results for the hypothesis comparing the muscle groups for female and male participants individually.
  - rmsplots.m: function used to obtain the movmean signal used to plot the figures of the static tasks.
