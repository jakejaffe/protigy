############################
## UI part
printHTMLUI <- function(id) {
    ns <- NS(id)

    htmlOutput(ns("html"))
}


#############################
## server part
printHTML <- function(input, output, session, what, error=NULL, global.input=NULL, global.param=NULL){

  ##cat('test: ',error$msg, '\nend\n')

    txt=''

    ## ##@#############################
    ## ## getting started
    if(what == 'gs'){
     
        ## render HTML
        output$html <- renderText({
            if(!is.null(global.input$file)) return()
            if(!is.null(error$msg)) return()
            includeMarkdown('readme.md')

        })
    }

    ##@###############################
    ## changelog
    if(what == 'cl'){
      txt <- '<h4><font color="red">What\'s new?</font></h4>
<font size=\"3\">
<b>v0.8.1 February 26, 2018</b>
<ul>
<li>Misc: simplified installation under Windows OS.</li>
<li>Misc: if Perl and/or Pandoc are not availbale the app will show a corresponding messsage.</li>
<li>PCA: "Run me first"-tab became obsolete.</li>
<li>Scatterplots: added trace of filtered values for reprodicibility filter.</li>
<li>Scatterplots: separated data tracks and added legend.</li>
</ul>
<b>v0.8.0.9 February 24, 2018</b>
<ul>
<li>GCT 1.3: robustified import of GCT 1.3 files. If not unique, row and column identifiers are made unique.</li>
<li>Volcano: Labeled points can be removed individually from the table.</li>
<li>Table: page overhaul</li>
</ul>
<b>v0.8.0.7 February 22, 2018</b>
<ul>
<li>Misc: PPI queries now work after export of results.</li>
</ul>
<b>v0.8.0.6 February 21, 2018</b>
<ul>
<li>UI: updated help text</li>
<li>UI: Only first 20 characters of column names are shown when prompted to select ID column.</li>
</ul>
<b>v0.8.0.5 February 20, 2018</b>
<ul>
<li>Export: fixed a bug preventing the export of results as zip-archive.</li>
</ul>
<b>v0.8.0.4 February 15, 2018</b>
<ul>
<li>Misc: Robustified import of gct 1.3 files (row and column names are made unique).</li>
</ul>
<b>v0.8.0.3 February 14, 2018</b>
<ul>
<li>Misc: new session import/export features</li>
</ul>
<b>v0.8.0.2 February 14, 2018</b>
<ul>
<li>Export: page overhaul</li>
<li>Export: generation of Rmarkdown-reports (still under developement).</li>
<li>Export: added option to download rmarkdown, xls, zip, separately.</li>
<li>Volcanos: color overhaul.</li>
<li>PPI: fixed a bug in which multiple occurences of selected bait proteins were not shown in zoomed view.</li>
<li>PPI: fixed the <i>all-turns-green</i> bug.</li>
<li>PPI: added ID mapping support for <i>mus musculus</i>, <i>rattus norvegicus</i> and <i>danio rerio</i>.</li>
<li>Multiscatter: robust determination of plotting limits.</li>
<li>Multiscatter: re-drawing only after button was pressed.</li>
</ul>
<b>v0.8.0.1 February 06, 2018</b>
<ul>
<li>Misc: Piwik integration.</li>
<li>Fanplot: colors are synchronized with current group selection.</li>
<li>Fanplot: added legend and possibility to modify labels.</li>
</ul>
<b>v0.8.0 January 25, 2018</b>
<ul>
<li>Release version for SSP (dev),</li>
<li>Session import: improved backwards compatibility.</li>
<li>Export: data directory is cleaned up now. Only .RData session files and the latest zip archive remain in the user/session data directory.</li>
</ul>
<b>v0.7.8.4 January 24, 2018</b>
<ul>
<li>Heatmap: interactive heatmap using "heatmaply".</li>
<li>Heatmap: annotation tracks (GCT 1.3) can be selected/deselected.</li>
<li>Clustering: default distance metric switched from <b>euclidean</b> to <b>1-Pearson</b>.</li>
<li>Clustering: Fanplot v0.1 - circular dendrogram to visualize sample clustering.</li>
<li>PCA: added legend to plots.</li>
<li>Misc: links to "Genecards" if ids are not UniProt.</li>
<li>Multiscatter: BA-filtered values shown in blue.</li>
</ul>
<b>v0.7.8.3 January 22, 2018</b>
<ul>
<li>PPI scatterplots: reduced opacity for non-interactors.</li>
<li>PPI: robustified extraction of gene symbols in function"get.interactors()".</li>
<li>Summary: new plot for missing values.</li>
<li>SSP import: backwards compatibility, sessions saved from older versions can be imported.</li>
<li>Gene name mapping: fixed bug that would cause a crash if neither UniProt nor RefSeq ids were found.</li>
<li>Gene name mapping: gene names that could not mapped are indicated by "NotFound".</li>
<li>Misc: improved start up time of the app using function "import.ppi.db()"</li>
<li>Misc: working button in the "Select Groups" modal window.</li>
</ul>
<b>v0.7.8.2 December 29, 2017</b>
<ul>
<li>Volcano: fixed overlaping legends.</li>
<li>Volcano: fixed fdr line bug.</li>
<li>Volcano: IDs are site-specific. Also effects PPI panel, i.e. a query always returns a single site rather than all sites mapping to a gene symbol.</li>
<li>Heatmap: GCT v1.3 annotation columns shown as tracks.</li>
<li>Misc: Groups defined in the experimental design or in GCT v1.3 annotation tracks can be enabled/disabled for testing.</li>
<li>Gene name mapping: finally works with RefSeq ids.</li>
</ul>
<b>v0.7.8.1 December 25, 2017</b>
<ul>
<li>Misc: added support for GCT v1.3 files. Class vector can be selected from column meta data.</li>
</ul>
<b>v0.7.8 December 4, 2017</b>
<ul>
<li>Heatmap: had to disable Morpheus widget since it would interfere with interactivity of volcono plots.</li>
<li>Misc: switched to "selectizeInput" to select saved sessions.</li>
<li>Misc: re-organization of navbarPage creation to fix an error thrown after Shiny R-packge update (v1.0.5)</li>
<li>Misc: integrated Readme.html into entry page.</li>
</ul>
<b>v0.7.7 October 30, 2017</b>
<ul>
<li>Heatmap: Morpheus integration (ALPHA)</li>
<li>Gene name mapping: robustified mapping if no RefSeq or UniProt ids were used.</li>
</ul>
<b>v0.7.6 September 02, 2017</b>
<ul>
<li>Misc: switched to <i>pacman</i> R package managment system.</li>
<li>Misc: added Readme on GitHub.</li>
<li>Normalization: Turned off automatic centering of Quantile-normalized data.</li>
</ul>
<b>v0.7.5 August 18, 2017</b>
<ul>
<li>Volcano: re-organization of PPI legends.</li>
<li>Scatterplots: PPI analysis is now fully integrated.</li>
<li>Heatmap: row annotations are shown correctly again.</li>
<li>Misc: gene mapping doesn\'t crash if no test was selected.</li>
<li>Misc: fixed a couple of other smaller bugs, mostly related to data exploration without performing a test.</li>
</ul>
<b>v0.7.4 August 10, 2017</b>
<ul>
<li>Scatterplots: new tab that provides interactive scatterplots between replicate measurements. For One-sample moderated T-test and F-test the significant proteins are marked in red.</li>
<li>Volcano: PPI - search mask keeps working after multiple rounds of analysis.</li>
<li>Misc: parameter file: fixed NA for data filter.</li>
</ul>
<b>v0.7.3.1 August 4, 2017</b>
<ul>
<li>Volcano plots: Fixed a bug causing volcano plots to crash when points were selected, but no protein-protein interactors were found.</li>
</ul>
<b>v0.7.3 June 20, 2017</b>
<ul>
<li>Misc: unified the naming of the id-column throughout the code.</li>
<li>Volcano plots: Integration of Reactome (human) protein-protein interactions.</li>
</ul>
<b>v0.7.2 June 6, 2017</b>
<ul>
<li>Volcano plots: added hyperbolic curves based on a minimal fold change cut-off and adjusted p-values.</li>
</ul>
<b>v0.7.1 June 1, 2017</b>
<ul>
<li>Misc: fixed a bug preventing the filter to be triggered after the user re-runs an analysis.</li>
<li>Volcano plots: integration of BioGRID (human) protein-protein interactions.</li>
<li>Volcano plots: <i>selectizeInput</i> now rendered on the server. Significantly speeded up page respond times.</li>
<li>Correlation matrix: updated color scheme to better visualize subtle differences.</li>
<li>Gene name mapping: fixed some bugs causing the app to crash if no gene names could be mapped or if other accessions than UniProt or RefSeq were used..</li>
<li>Misc: loading animation.</li>
</ul>
<b>v0.7.0 May 5, 2017</b>
<ul>
<li>Misc: automatic mapping to gene names if RefSeq or UniProt accession numbers were found in "id" column.</li>
<li>Volcano plots: integration of InWeb database.</li>
<li>Volcano plots: paramater "max. Log10(p-value)" works in all volcano plots. Before, changing the parameter only worked in the parameter panel of the first volcano.</li>
<li>Volcano plots: completely zoomable</li>
<li>Volcano plots: button to reset volcano annotations</li>
</ul>
<b>v0.6.6.1 Mar 17, 2017</b>
<ul>
<li>Export-tab: PCA loadings can be exported as Excel sheet (by Ozan Aygun).</li>
<li>PCA-tab: New PCA loadings plot (by Ozan Aygun).</li>
<li>Export-tab: included button for PCA loadings in \"toggle all\".</li>
<li>Heatmap-tab: Default vaules for row/column fon size read from \"plotparams\", if defined.</li>
</ul>
<b>v0.6.6 Mar 17, 2017</b>
<ul>
<li>Fixed the \"incorrect number of dimensions\"-error in the table preview tab, if only a single annotation column is present.</li>
<li>Prevented the automatic switch to the \"Summary\"-tab after changing the filter.</li>
<li>Related to the previous point, the result filter is now implemented as observer rather than a reactive function.</li>
<li>Summary-tab: fixed the workflow box showing NA when selecting filter \"none\" or \"top.n\".</li>
<li>Dynamic UI elements will not switch back to \"One-sample modT\" after running an analysis.</li>
<li>Table-tab: switched to DT package.</li>
</ul>
<b>v0.6.5 Mar 7, 2017</b>
<ul>
<li>Fixed a bug that resulted in not listing all saved session for a user.</li>
<li>Worked on the filenames of exported RData and Excel files.</li>
<li>modF: In case of too many missing values the test would not return a p-value which resulted in NA for the enumber of significant hits on the summary page.</li>
</ul>
<b>v0.6.4 Mar 6, 2017</b>
<ul>
<li>Summary tab: number of significant hits are now reported correctly.</li>
<li>Summary tab: Missing value distribution after log-transformation shown correctly.</li>
<li>Changed cluster method from \'complete\' to \'ward\'.</li>
<li>Fixed a bug that happend if a project is defined and shared in \'user-roles.txt\' but has been deleted from the server.</li>
</ul>
<b>v0.6.3 Feb 2, 2017</b>
<ul>
<li>Commited to GitHub for debugging purposes. Do not use this verion!</li>
<li>Re-organization of UI elements when setting up the analysis.</li>
<li>Implementation of SD filter across all samples.</li>
</ul>
<b>v0.6.2 Jan 31, 2017</b>
<ul>
<li>UI elements for setting up an anlysis workflow are now dynamically generated, e.g. if reproducibility filter is chosen, onnly "One-sample modT" or "none" can be chosen.</li>
<li>Reproducibility filter: users can choose bewteen (predefined) alpha-values.</li>
<li>Increased number of colors by 60 (85 total).</li>
<li>Correlation matrix: increased the size of exported heatmap to 12x12 inches.</li>
<li>Multiscatter: increased number of digits to three.</li>
<li>Some more error handling when exporting analysis results.</li>
<li>Previously saved sessions are not deleted anymore, if checkbox "save session" is not enabled.</li>
</ul>
<b>v0.6.1 Jan 12, 2017</b>
<ul>
<li>Session managment: Added possibility to delete saved sessions and to choose whether to save a session on the server in the first place.</li>
<li>User role managment (alpha status): A project saved on the server has an owner and (optional) collaborators. Collaborators can \"see\" projects they are assigned to in the dropdown menu \"Saved sessions\".</li>
</ul>
<b>v0.6.0 Jan 4, 2017</b>
<ul>
<li>Switched to <a href="https://rstudio.github.io/shinydashboard/">Shiny Dashboards</a>.</li>
<li>Extented PCA analysis using the <i>ChemometricsWithR</i> R package.</li>
</ul>
<b>v0.5.4  Dec 27, 2016</b>
<ul>
<li>Filter values and plotting parameters are now restored after session import (except for volcano plot...).</li>
<li>Changed visual style of volcano plots.</li>
</ul>
<b>v0.5.3 Dec 21, 2016</b>
<ul>
<li>Minor fixes due to shiny update.</li>
<li>User can now specify label names used to create file and session names when  exporting results. Initial values are taken from filenames of the input and experimental design file.</li>
<li>Experimental design file is now part of the results.</li>
</ul>
<b>v0.5.2 Dec 1, 2016</b>
<ul>
<li>Rudimentary support of \'gct\' files, i.e. files can be imported by ignoring the first two lines (gct header). </li>
<li>Figured out the issue with  the 2-sample T-test volcanos. The functions in \'limma\' always report fold changes group factor variable \'0\'. The original \'moderated.t\' alphabetically orders the class names and then converts class names to factors. First class name will become zero. I make sure that class names are alphabeticaly sorted before calling \'moderated.t\'.</li>
</ul>
<b>v0.5.1 Nov 26, 2016</b>
<ul>
<li><mark>BUG: </mark>Reverted the indication of direction in volcano plots for <b>2-sample tests</b>. The direction was inferred from the sign of \'logFC\' returned by function \'topTable\' (limma) which cannot be used to do that.</li>
<li>Updated shiny R package from 0.12/0.13.2 to 0.14.2 resulting in some minor changes in the <i>look and feel</i> of the app. Code needed some adaptions (navbarPage, navbarMenu) to run poperly with 0.14.2 version.</li>
<li>Outsourced HTML instructions to a separate file using Shiny-module framework.</li>
<li>Changed how heatmap dimensions are determined to better show very large and very small heatmaps.</li>
<li>Scaling of heatmap done after clustering.</li>
</ul>
<b>v0.5.0 Nov 7, 2016</b>
<ul>
<li>Exported sessions are saved on the server and can be re-imported. Each user has its own folder on ther server in which an R-sessions file is stored.</li>
<li>Non-unique entries in the id column are made unique, e.g. \'Abl\', \'Abl\' -> \'Abl\', \'Abl_1\'. Empty entries will be replaced by \'X\', e.g. \'Abl\', \'\', \'\' -> \'Abl\', \'X\', \'X_1\'.</li>
</ul>
<b>v0.4.5 Sep 1, 2016</b>
<ul>
<li>Multiscatter: log-transformed values wil be used if log-transformation has been applied.</li>
<li>For each user a new folder on the server is created. Every session that gets exported will be saved there.</li>
<li>A copy of the original data file will be part of the results (zip-file).</li>
</ul>
<b>v0.4.4 Aug 19, 2016</b>
<ul>
<li>New \'Export\'-tab to download a zip-file containing:
 <ul>
   <li>all figures (pdf).</li>
   <li>result table (xlsx).</li>
   <li>session file (Rdata) which can be imported back into the app.</li>
   <li>parameter file (txt)</li>
 </ul>
<li>Directionality of two-sample test is now indicated in the volcano plots.</li>
<li>Error handling for two-component normalization.</li>
<li>Profile plots under \'QC\'-tab</li>
</ul>
<b>v0.4.3 Aug 16, 2016</b>
<ul>
<li>Session export/import.</li>
<li>"#VALUE!"-entries from Excel can be handeled now.</li>
<li>Fixed bug causing PDF export of heatmap with user defined max. values to crash.</li>
</ul>
<b>v0.4.2 Jul 21, 2016</b>
<ul>
<li><mark>BUG:</mark> Bugfix in 2-sample test that occured whenever the names of different groups defined the experimental design file started with the same series of characters, e.g. \'ABC\' and \'ABCD\'.</li>
</ul>
<b>v0.4.1 Jul 1, 2016</b>
<ul>
<li>Novel tab summarizing the analysis.</i>
<li>Data can now be log-transformed, e.g. for MaxQuant results.</li>
<li>Added option to skip testing, e.g. for PCA analysis.</li>
<li>User can specify principle components in the PCA scatterplot.</li>
</ul>
<b>v0.4 Jun 29, 2016</b>
<ul>
<li>Integration of moderated F statistics</li>
<li>Disabled column-based clustering one-sample and two-sample tests if multiple groups are being compared.</li>
</ul>
<b>v0.3 Mar 11, 2016</b>
<ul>
<li>Data normalization.</li>
<li>Reproducibility filter.</li>
<li>Upload/download of experimental design files.</li>
<li>Download of native Excel files.</li>
<li>Integration of the Javascript D3-based plotly library.</li>
</ul>
<b>v0.2 Feb 23, 2016</b>
<ul>
<li>Working version on server.</li>
</ul>
<b>v0.1 Dec 20, 2015</b>
<ul>
<li>First prototype.</li>
</ul>
</font>'
#,sep='')

        ## render HTML
        output$html <- renderText({
            if(!is.null(global.input$file)) return()

            HTML(txt)
        })
    }

    ##@#########################################
    ## id column / exp design template
    if(what == 'id'){

        txt <- paste('<br><br><p><font size=\"4\"><b>Group assigment</b></br>
Here you can download a template of an experimental design file. You can open this file in Excel and define the groups you want to compare. Replicate measurements have to be grouped under a single name in the \'Experiment\'-column. <mark>Please don\'t use special characters, like blanks or any punctuation, when defining these names!</mark></font></p>
<br><p><font size=\"4\"><b>Select ID column</b></br>
Choose a column from the list on the left that contains <b>unique</b> identifiers for the features in the data table. If the enntries are not unique, uniqueness will enforces by appending \"_1\". Preferably, IDs should be unique protein accession numbers (e.g. <font face=\"Courier\">NP_073737</font>) or a combination of protein accession and residue number in case of PTM analysis (e.g. <font face=\"Courier\">NP_073737_S544s _1_1_544_544</font>).</p>  
<br><p><font size=\"4\"><b>Automatic retrieval of gene symbols</b></br>
If the ID column contains <a href=\"http://www.uniprot.org/\" target=\"_blank_\">UniProt</a> or <a href=\"https://www.ncbi.nlm.nih.gov/refseq/\" target=\"_blank_\">RefSeq</a> accession numbers, the software will try to map those ids to gene symbols. Currently, mapping of following organisms is supported:
<ul>
<li>human (<i>Homo sapiens</i>)</li>
<li>mouse (<i>Mus musculus</i>)</li>
<li>rat (<i>Rattus norvegicus</i>)</li>
<li>zebrafish (<i>Danio rerio</i>)</li>
</ul>
</font></p>')

        ## render HTML
        output$html <- renderText({

            if(global.param$analysis.run) return()
            if(global.param$id.done) return()
            if(!global.param$file.done) return()
            
            #if(is.null(global.input$id.col)) return() ## start page

            #if(global.input$id.col > 0 && !is.null(global.param$id.col.value)) return() ## after id column is choosen

            HTML(txt)
        })
    }
    #####################################################################
    ## upload of experimental design file
    if(what == 'ed'){

        txt <- paste('<br><br><p><font size=\"4\">Please upload the experimental design file that you have created using the upload button on the left.</p></font></p>')

        ## render HTML
        output$html <- renderText({

            if(global.param$analysis.run) return()
            if(!global.param$file.done) return()

            if( is.null(global.param$id.col.value) ) return()
          
            #if(global.input$id.col ==0) return()
            if(global.param$file.gct3) return()
            #if(global.param$id.done) return()  
            if(global.param$grp.done) return()

            HTML(txt)
        })
    }
    #####################################################################
    ## gct v3
    if(what == 'gct3'){
      
      #txt <- paste('<br><br><p><font size=\"4\">Found GCT v1.3 file with', ncol(global.input$cdesc),'annotation columns. Choose one column as class vector for marker selection.</p></font></p>')
      txt <- paste('<br><p><font size=\"4\"><b>Found GCT v1.3 file</b><br>Choose the annotation column to use as class vector for marker selection.</p></font></p>')
      
      ## render HTML
      output$html <- renderText({
        
        if(global.param$analysis.run) return()
        if(!global.param$file.gct3) return()
        
        #if(global.param$id.done) return()  
        if(global.param$grp.done) return()
        
        HTML(txt)
      })
    }
    
    
    
    
    ## ####################################################################
    ## analysis
    if(what == 'ana'){

        txt <- paste('<font size=\"4\">
<p><h3>Log-transformation</h3>Apply log transformation to the data.</p>
<p><h3>Data normalization</h3>You can apply different normalization methods to the data prior to testing. The methods are applied for each column separately, except for \'Quantile\'-normalization which takes the entire matrix into account.</p>
<p>
<ul>
<li><b>Median</b>: Subtract the sample median from each value (centering).</li>
<li><b>Median-MAD</b>: Subtract the sample median and divide by sample MAD (centering plus scaling).</li>
<li><b>2-component</b>: Use a mixture-model approach to separate non-changing from changing features and divide both populations by the median of the non-changing features.</li>
<li><b>Quantile</b>: Transform the data such that the quantiles of all sample distributions are the equal.</li>
<li><b>none</b>: The data will be taken as is. Should be used if the data has been already normalized.</li>
</ul>
<br><p><h3>Reproducibility filter</h3>This option is only considered in a <b>one-sample test</b> and will be ignored otherwise. For duplicate measurements a Bland-Altman Filter of 99.9% (+/-3.29 sigma) will be applied. For more than two replicate measurements per group a generalized reproducibility filter is applied which is based on a linear mixed effects model to model the within-group variance and between-group variance (See \'MethComp book (pp 58-61). <i>Comparing Clinical Measurement Methods</i> by Bendix Carstensen\' for more details). You can inspect the results of the filtering step in the multiscatter plot under the \'QC\'-tab. Data points removed prior to testing will be depicted in red.</p>

<br><h3>Select test</h3>You can choose between a one-sample, two-sample moderate T-tests, moderated F-test or no testing.
<ul>
<li><b>One-sample mod T</b>: For each test whether the group mean is significantly different from zero. Only meaningful to <b>ratio data</b>!</li>
<li><b>Two-sample mod T</b>: For each possible pairwise comparison of groups test whether the group means are significantly different from each other.</li>
<li><b>mod F</b>: Test whether there is a significant difference between any of the difined groups. Should be used if more than 2 groups are being compared. Only meaningful to <b>ratio data</b>!</li>
<li><b>none</b>: Don\'t do any test. Useful for data exploration such as PCA.</li>
</ul>
<br></font></p>')

        ## render HTML
        output$html <- renderText({
             if(global.param$analysis.run) return()
##             if( !is.null(error$msg) ) return()

             if(global.param$grp.done == F) return()
             if(!is.null(global.input$run.test))
                 if(global.input$run.test > 0) return()

             HTML(txt)
        })
    }

    ## ####################################################################
    ## analysis
    if(what == 'res'){

        txt <- paste('<p><font size=\"4\">This page allows you to interactively explore the results of you analyis. On the left you can choose between different filters, the results will be updated immediately. The filter that you specify applies to all tabs (\'Heatmap\', \'Volcanos\', ...), except the \'QC\' which shows the entire dataset. You can change the appearance of the heatmap by modifying the parameters below, you can select points shown in the Volcano plots and browse through the result table.</font></p><br>')

        ## render HTML
        output$html <- renderText({
        ##     if( !is.null(error$msg) ) return()

            if(global.param$grp.done == F) return()
            if(!is.null(global.input$run.test))
                if(global.input$run.test == 0) return()

            HTML(txt)
        })
    }


} ## end printHTML

