package SBEAMS::Biomarker::Tables;

###############################################################################
# Program     : SBEAMS::Biomarker::Tables
# Author      : Eric Deutsch <edeutsch@systemsbiology.org>
# $Id$
#
# Description : This is part of the SBEAMS::Biomarker module which provides
#               a level of abstraction to the database tables.
#
###############################################################################


use strict;

use SBEAMS::Connection::Settings;


use vars qw(@ISA @EXPORT 
    
    $TB_ORGANISM

    $TBBL_BIOSEQUENCE_SET
    $TBBL_DBXREF
    $TBBL_BIOSEQUENCE
    $TBBL_BIOSEQUENCE_PROPERTY_SET
    $TBBL_QUERY_OPTION
		$TBBM_BMRK_TREATMENT
		$TBBM_BMRK_TREATMENT_TYPE

    $TBBM_BMRK_BIOSOURCE
    $TBBM_BMRK_BIOSAMPLE
    $TBBM_BMRK_DISEASE
    $TBBM_BMRK_ATTRIBUTE_TYPE
    $TBBM_BMRK_ATTRIBUTE
    $TBBM_BMRK_BIOSOURCE_ATTRIBUTE
    $TBBM_BMRK_BIOSAMPLE_ATTRIBUTE
    $TBBM_BMRK_BIOSOURCE_DISEASE
    $TBBM_BMRK_STORAGE_LOCATION
    $TBBM_BMRK_ANALYSIS_FILE
    $TBBM_BMRK_EXPERIMENT
    $TBBM_BMRK_EXPERIMENT_TYPE
    $TBBM_BMRK_TREATMENT
    $TBBM_BMRK_TREATEMENT_TYPE
);


require Exporter;
@ISA = qw (Exporter);

@EXPORT = qw (
    $TB_ORGANISM

    $TBBL_BIOSEQUENCE_SET
    $TBBL_DBXREF
    $TBBL_BIOSEQUENCE
    $TBBL_BIOSEQUENCE_PROPERTY_SET
    $TBBL_QUERY_OPTION
		$TBBM_BMRK_TREATMENT
		$TBBM_BMRK_TREATMENT_TYPE

    $TBBM_BMRK_BIOSOURCE
    $TBBM_BMRK_BIOSAMPLE
    $TBBM_BMRK_DISEASE
    $TBBM_BMRK_ATTRIBUTE_TYPE
    $TBBM_BMRK_ATTRIBUTE
    $TBBM_BMRK_BIOSOURCE_ATTRIBUTE
    $TBBM_BMRK_BIOSAMPLE_ATTRIBUTE
    $TBBM_BMRK_BIOSOURCE_DISEASE
    $TBBM_BMRK_STORAGE_LOCATION
    $TBBM_BMRK_ANALYSIS_FILE
    $TBBM_BMRK_EXPERIMENT
    $TBBM_BMRK_EXPERIMENT_TYPE
    $TBBM_BMRK_TREATMENT
    $TBBM_BMRK_TREATEMENT_TYPE
);


#### Get the appropriate database prefixes for the SBEAMS core and this module
my $core = $DBPREFIX{Core};
my $bl   = $DBPREFIX{BioLink};
my $mod  = $DBPREFIX{Biomarker};

$TB_ORGANISM                      = "${core}organism";

$TBBL_BIOSEQUENCE_SET       = "${bl}biosequence_set";
$TBBL_DBXREF                = "${bl}dbxref";
$TBBL_BIOSEQUENCE           = "${bl}biosequence";
$TBBL_BIOSEQUENCE_PROPERTY_SET   = "${bl}biosequence_property_set";
$TBBL_QUERY_OPTION          = "${bl}query_option";

$TBBM_BMRK_BIOSOURCE           = "${mod}BMRK_biosource";
$TBBM_BMRK_BIOSAMPLE           = "${mod}BMRK_biosample";
$TBBM_BMRK_DISEASE             = "${mod}BMRK_disease";
$TBBM_BMRK_ATTRIBUTE_TYPE      = "${mod}BMRK_attribute_type";
$TBBM_BMRK_ATTRIBUTE           = "${mod}BMRK_attribute";
$TBBM_BMRK_BIOSOURCE_ATTRIBUTE = "${mod}BMRK_biosource_attribute";
$TBBM_BMRK_BIOSAMPLE_ATTRIBUTE = "${mod}BMRK_biosample_attribute";
$TBBM_BMRK_BIOSOURCE_DISEASE   = "${mod}BMRK_attribute";
$TBBM_BMRK_STORAGE_LOCATION    = "${mod}BMRK_storage_location";
$TBBM_BMRK_ANALYSIS_FILE       = "${mod}BMRK_analysis_file";
$TBBM_BMRK_EXPERIMENT          = "${mod}BMRK_experiment";
$TBBM_BMRK_EXPERIMENT_TYPE     = "${mod}BMRK_experiment_type";
$TBBM_BMRK_TREATMENT             = "${mod}BMRK_treatment";
$TBBM_BMRK_TREATMENT_TYPE        = "${mod}BMRK_treatment_type";


1;
