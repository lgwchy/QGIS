/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * tests/scripts/sipifyheader.h                                         *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/








typedef qint64 QgsFeatureId;

typedef QSet<qint64 > QgsFeatureIds;
typedef QMap<qint64 , QMap<int, QVariant>> QgsChangedAttributesMap;
typedef QMap<qint64, QMap<int, QVariant> > QgsChangedAttributesMap;
typedef QMap<qint64, QMap<int, QVariant>> QgsChangedAttributesMap;

typedef QVector<QVariant> QgsSuperClass;

%MappedType QgsSuperClass
{
  // The annotations are modified by astyle (these will be fixed by sipify.pl)
%TypeHeaderCode
#include <qgssipifyheader.h>
%End

%ConvertFromTypeCode
  // Create the list.
  PyObject *l;
  return l;
%End
}

class QgsSipifyHeader : QtClass<QVariant>
{
%Docstring
 Documentation goes here
.. versionadded:: 3.0
.. note::

   some other note
%End

%TypeHeaderCode
#include "sipifyheader.h"
%End
  public:
    enum MyEnum
    {
      Success,
      NoSuccess,
    };

    explicit QgsSipifyHeader();
%Docstring
A constructor with definition in header
%End

    QgsSipifyHeader( QWidget *parent /TransferThis/ = 0 );
%Docstring
 A classic constructor with arguments
%End

    QgsSipifyHeader();
%Docstring
Default constructor
%End

    void multilineMethod( const QgsPoint &startPoint,
                          QgsFeatureId featureId,
                          QgsVectorLayer *vl,
                          QgsSnapper::SnappingType snap_to ) const;
%Docstring
A multiline method signature
%End


    virtual QgsMapLayerRenderer *createMapRenderer( QgsRenderContext &rendererContext ) /Factory/;
%Docstring
Factory annotation
%End

    SomeObject *createAnother() /Factory/;

    void LongDocStringMethod();
%Docstring
 My long doc string
 is not very interesting!
%End

    void LongDocStringMethodWithBrief();
%Docstring
 some brief
 My long doc string
 is not very interesting!
%End

    bool isOKwithErrMesg( QString &ErrMsg /Out/ );

    void InOutParam( bool &ok = true /In,Out/ );

    void setDiagramRenderer( QgsDiagramRenderer *r /Transfer/ );

    void differentDefaultValue( bool defaultValue = false , QWidget *parent = 0, QString msg = "hello"  );

    void differentType( QList<qint64>  &list );

    void complexDefaultValueAndType( QList<QPair<qint64 , QMap<int, QString>>> list = QList<QPair<qint64, QMap<int, QString>>> );
%Docstring
complex default value and type (i.e. containing commas) should be given as a string with single quotes
%End

    inlineKeyWordShouldNotAppear();

    QString labelForRange( double lower, double upper ) const /PyName=labelForLowerUpper/;

    void setComposition( QgsComposition *c /KeepReference/ );

    void removeProxyFactory( QNetworkProxyFactory *factory /TransferBack/ );

    bool removeFunctionBody( const QList<int, QString> &list, QgsVectorLayer *vl );

  protected:
    bool thisShouldBeListed();

  private:
    void privateMethodSIPRUNareShown();
  public:
    void FallBackToPublic();

};

class ClassWithPrivateInheritanceOnly
{
%Docstring
 Documentation goes here
%End

%TypeHeaderCode
#include "sipifyheader.h"
%End
    explicit ClassWithPrivateInheritanceOnly();
%Docstring
A constructor with definition in header on several lines
%End

}


/************************************************************************
 * This file has been generated automatically from                      *
 *                                                                      *
 * tests/scripts/sipifyheader.h                                         *
 *                                                                      *
 * Do not edit manually ! Edit header and run scripts/sipify.pl again   *
 ************************************************************************/
