# -*- coding: utf-8 -*-

"""
***************************************************************************
    DensifyGeometriesInterval.py by Anita Graser, Dec 2012
    based on DensifyGeometries.py
    ---------------------
    Date                 : October 2012
    Copyright            : (C) 2012 by Victor Olaya
    Email                : volayaf at gmail dot com
***************************************************************************
*                                                                         *
*   This program is free software; you can redistribute it and/or modify  *
*   it under the terms of the GNU General Public License as published by  *
*   the Free Software Foundation; either version 2 of the License, or     *
*   (at your option) any later version.                                   *
*                                                                         *
***************************************************************************
"""
from builtins import range

__author__ = 'Anita Graser'
__date__ = 'Dec 2012'
__copyright__ = '(C) 2012, Anita Graser'

# This will get replaced with a git SHA1 when you do a git archive

__revision__ = '$Format:%H$'

from math import sqrt

from qgis.core import QgsPoint, QgsGeometry, QgsWkbTypes

from processing.core.GeoAlgorithm import GeoAlgorithm
from processing.core.parameters import ParameterVector
from processing.core.parameters import ParameterNumber
from processing.core.outputs import OutputVector
from processing.tools import dataobjects, vector


class DensifyGeometriesInterval(GeoAlgorithm):

    INPUT = 'INPUT'
    INTERVAL = 'INTERVAL'
    OUTPUT = 'OUTPUT'

    def defineCharacteristics(self):
        self.name, self.i18n_name = self.trAlgorithm('Densify geometries given an interval')
        self.group, self.i18n_group = self.trAlgorithm('Vector geometry tools')

        self.addParameter(ParameterVector(self.INPUT,
                                          self.tr('Input layer'),
                                          [dataobjects.TYPE_VECTOR_POLYGON, dataobjects.TYPE_VECTOR_LINE]))
        self.addParameter(ParameterNumber(self.INTERVAL,
                                          self.tr('Interval between vertices to add'), 0.0, 10000000.0, 1.0))

        self.addOutput(OutputVector(self.OUTPUT, self.tr('Densified')))

    def processAlgorithm(self, feedback):
        layer = dataobjects.getObjectFromUri(self.getParameterValue(self.INPUT))
        interval = self.getParameterValue(self.INTERVAL)

        isPolygon = layer.geometryType() == QgsWkbTypes.PolygonGeometry

        writer = self.getOutputFromName(
            self.OUTPUT).getVectorWriter(layer.fields().toList(),
                                         layer.wkbType(), layer.crs())

        features = vector.features(layer)
        total = 100.0 / len(features)
        for current, f in enumerate(features):
            feature = f
            if feature.hasGeometry():
                new_geometry = feature.geometry().densifyByCount(float(interval))
                feature.setGeometry(new_geometry)
            writer.addFeature(feature)

            feedback.setProgress(int(current * total))

        del writer
