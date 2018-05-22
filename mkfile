<config.mk

results/%.markDups.bam: data/%.bam
	mkdir -p `dirname $target`
	java -jar $PICARD MarkDuplicates \
        	INPUT=$prereq \
        	OUTPUT=$target".build" \
        	METRICS_FILE=$stem".markDups_metrics.txt" \
        	REMOVE_DUPLICATES=false \
        	ASSUME_SORTED=true \
        	PROGRAM_RECORD_ID='null' \
        	VALIDATION_STRINGENCY=LENIENT \
	&& samtools index $target".build" \
	&& mv $target".build" $target \
	&& mv $target".build.bai" $target".bai" \

