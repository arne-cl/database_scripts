-- get all chromatograms with comment mentioning valdis and join to all samples that have aliquotID (only biological samples)
-- only VALDIS / TROST2 samples!!!
SELECT        tf.SampleInfo.value as aliquot_id, GC_Chromatogram.name
FROM            GC_Chromatogram INNER JOIN
                         Vial ON GC_Chromatogram.id = Vial.FK_chromatogram INNER JOIN
                         Sample ON Vial.FK_sample = Sample.id AND Vial.FK_sample = Sample.id INNER JOIN
                         tf.SampleInfo ON Sample.id = tf.SampleInfo.FK_Sample AND Sample.id = tf.SampleInfo.FK_Sample
WHERE        (GC_Chromatogram.Comment LIKE '%valdis%' OR GC_Chromatogram.Comment LIKE  '%trost2%') AND (tf.SampleInfo.attribute = 'Aliquot_ID') AND tf.SampleInfo.value != 'NA'