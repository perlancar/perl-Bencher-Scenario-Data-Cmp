package Bencher::Scenario::Data::Cmp;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our $scenario = {
    summary => 'Benchmark Data::Cmp against similar solutions',
    participants => [
        {
            fcall_template => 'Data::Cmp::cmp_data(<data1>, <data2>)',
        },
        {
            fcall_template => 'Data::Cmp::Numeric::cmp_data(<data1>, <data2>)',
        },
        {
            fcall_template => 'Data::Cmp::StrOrNumeric::cmp_data(<data1>, <data2>)',
        },
        {
            module => 'JSON::PP',
            code_template => 'JSON::PP::encode_json(<data1>) eq JSON::PP::encode_json(<data2>)',
        },
        {
            fcall_template => 'Data::Compare::Compare(<data1>, <data2>)',
        },
    ],

    datasets => [
        {
            name=>'empty arrays',
            args=>{
                data1=>[],
                data2=>[],
            },
        },
        {
            name=>'small arrays',
            args=>{
                data1=>[1,2,[],3,4],
                data2=>[1,2,[],5,4],
            },
        },
        {
            name=>'1k array of ints',
            args=>{
                data1=>[1..1000],
                data2=>[1..1000],
            },
        },
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES


=head1 SEE ALSO

L<Bencher::Scenario::Scalar::Cmp>

L<Bencher::Scenario::Serializers>
