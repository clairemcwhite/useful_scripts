#!/usr/bin/env Rscript

suppressPackageStartupMessages(library(argparse))
# Create parser object
parser <- ArgumentParser()
# Specify arguments
parser$add_argument("-f", "--filename", dest="filename", required=TRUE,
                        help="Input filename")

parser$add_argument("-o", "--option", action="store", required=TRUE,
                        dest="option", choices=c('A', 'B'),
                        help="Choose either A or B")

parser$add_argument("-n", "--number", action="store",
                        dest="number", type='integer', default=1,
                        help = "An integer")

args <- parser$parse_args()

print(args$filename)
print(args$option)
print(args$number)
