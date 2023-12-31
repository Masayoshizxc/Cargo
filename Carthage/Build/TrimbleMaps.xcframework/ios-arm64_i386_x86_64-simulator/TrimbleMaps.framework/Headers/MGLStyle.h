#import <Foundation/Foundation.h>

#import "MGLFoundation.h"
#import "MGLStyleLayer.h"

#import "MGLTypes.h"

@class MGLSource;
@class MGLLight;

NS_ASSUME_NONNULL_BEGIN

/**
 A version number identifying the default version of the Mapbox Streets style
 obtained through the `MGLStyle.streetsStyleURL` method. This version number may also be
 passed into the `+[MGLStyle streetsStyleURLWithVersion:]` method.

 The value of this constant generally corresponds to the latest released version
 as of the date on which this SDK was published. You can use this constant to
 ascertain the style used by `MGLMapView` and `MGLTilePyramidOfflineRegion` when
 no style URL is specified. Consult the
 <a href="https://docs.mapbox.com/api/maps/#styles">Mapbox Styles API documentation</a>
 for the most up-to-date style versioning information.

 @warning The value of this constant may change in a future release of the SDK.
    If you use any feature that depends on a specific aspect of a default style
    — for instance, the minimum zoom level that includes roads — you may use the
    current value of this constant or the underlying style URL, but do not use
    the constant itself. Such details may change significantly from version to
    version.
 */
static MGL_EXPORT const NSInteger MGLStyleDefaultVersion = 11;

FOUNDATION_EXTERN MGL_EXPORT MGLExceptionName const MGLInvalidStyleURLException;
FOUNDATION_EXTERN MGL_EXPORT MGLExceptionName const MGLRedundantLayerException;
FOUNDATION_EXTERN MGL_EXPORT MGLExceptionName const MGLRedundantLayerIdentifierException;
FOUNDATION_EXTERN MGL_EXPORT MGLExceptionName const MGLRedundantSourceException;
FOUNDATION_EXTERN MGL_EXPORT MGLExceptionName const MGLRedundantSourceIdentifierException;

/**
 The proxy object for the current map style.

 MGLStyle provides a set of convenience methods for changing Mapbox
 default styles using `MGLMapView.styleURL`.
 <a href="https://www.mapbox.com/maps/">Learn more about Mapbox default styles</a>.

 It is also possible to directly manipulate the current map style
 via `MGLMapView.style` by updating the style's data sources or layers.

 @note Wait until the map style has finished loading before modifying a map's
    style via any of the `MGLStyle` instance methods below. You can use the
    `-[MGLMapViewDelegate mapView:didFinishLoadingStyle:]` or
    `-[MGLMapViewDelegate mapViewDidFinishLoadingMap:]` methods as indicators
    that it's safe to modify the map's style.

 #### Related examples
 See the <a href="https://docs.mapbox.com/ios/maps/examples/default-styles/">
 Default styles</a> example to learn how to initialize an `MGLMapView` object
 with a Mapbox default style using `MGLStyle`'s class methods.
 */
MGL_EXPORT
@interface MGLStyle : NSObject

#pragma mark Accessing Default Styles

@property (class, nonatomic, readonly) NSURL *mobileDefaultStyleURL;
@property (class, nonatomic, readonly) NSURL *mobileDayStyleURL;
@property (class, nonatomic, readonly) NSURL *mobileNightStyleURL;
@property (class, nonatomic, readonly) NSURL *mobileSatelliteStyleURL;
@property (class, nonatomic, readonly) NSURL *defaultStyleURL;
@property (class, nonatomic, readonly) NSURL *transportationStyleURL;
@property (class, nonatomic, readonly) NSURL *satelliteStyleURL;
@property (class, nonatomic, readonly) NSURL *terrainStyleURL;
@property (class, nonatomic, readonly) NSURL *basicStyleURL;
@property (class, nonatomic, readonly) NSURL *dataLightStyleURL;
@property (class, nonatomic, readonly) NSURL *dataDarkStyleURL;


#pragma mark Accessing Metadata About the Style

/**
 The name of the style.

 You can customize the style’s name in Mapbox Studio.
 */
@property (readonly, copy, nullable) NSString *name;


#pragma mark Managing Sources

/**
 A set containing the style’s sources.
 */
@property (nonatomic, strong) NSSet<__kindof MGLSource *> *sources;

/**
 Values describing animated transitions to changes on a style's individual
 paint properties.
 */
@property (nonatomic) MGLTransition transition;

/**
 A boolean value indicating whether label placement transitions are enabled.

 The default value of this property is `YES`.
 */
@property (nonatomic, assign) BOOL performsPlacementTransitions;

/**
A set containing user-specified source layer identifiers for point features available for accessibility. The features should have a `MGLVectorTileSource` and belong to a source layer. The point features must have a `name` attribute that matches those specified by <a href="https://www.mapbox.com/vector-tiles/mapbox-streets-v8/#overview">Mapbox Streets</a> source and belong to a `MGLVectorStyleLayer`.
 
This set does not include Mapbox Streets source identifiers, which are included by default.
*/
@property (nonatomic) NSSet <NSString *> *accessiblePlaceSourceLayerIdentifiers;

/**
 Returns a source with the given identifier in the current style.

 @note Source identifiers are not guaranteed to exist across styles or different
    versions of the same style. Applications that use this API must first set the
    style URL to an explicitly versioned style using a convenience method like
    `+[MGLStyle outdoorsStyleURLWithVersion:]`, `MGLMapView`’s “Style URL”
    inspectable in Interface Builder, or a manually constructed `NSURL`. This
    approach also avoids source identifier name changes that will occur in the default
    style’s sources over time.

 @return An instance of a concrete subclass of `MGLSource` associated with the
    given identifier, or `nil` if the current style contains no such source.
 */
- (nullable MGLSource *)sourceWithIdentifier:(NSString *)identifier;

/**
 Adds a new source to the current style.

 @note Adding the same source instance more than once will result in a
    `MGLRedundantSourceException`. Reusing the same source identifier, even with
    different source instances, will result in a
    `MGLRedundantSourceIdentifierException`.

 @note Sources should be added in
    `-[MGLMapViewDelegate mapView:didFinishLoadingStyle:]` or
    `-[MGLMapViewDelegate mapViewDidFinishLoadingMap:]` to ensure that the map
    has loaded the style and is ready to accept a new source.

 @param source The source to add to the current style.
 */
- (void)addSource:(MGLSource *)source;

/**
 Removes a source from the current style.

 @note Source identifiers are not guaranteed to exist across styles or different
    versions of the same style. Applications that use this API must first set the
    style URL to an explicitly versioned style using a convenience method like
    `+[MGLStyle outdoorsStyleURLWithVersion:]`, `MGLMapView`’s “Style URL”
    inspectable in Interface Builder, or a manually constructed `NSURL`. This
    approach also avoids source identifier name changes that will occur in the default
    style’s sources over time.

 @param source The source to remove from the current style.
 */
- (void)removeSource:(MGLSource *)source;

/**
 Removes a source from the current style.

 @note Source identifiers are not guaranteed to exist across styles or different
 versions of the same style. Applications that use this API must first set the
 style URL to an explicitly versioned style using a convenience method like
 `+[MGLStyle outdoorsStyleURLWithVersion:]`, `MGLMapView`’s “Style URL”
 inspectable in Interface Builder, or a manually constructed `NSURL`. This
 approach also avoids source identifier name changes that will occur in the default
 style’s sources over time.

 @param source The source to remove from the current style.
 @param outError Upon return, if an error has occurred, a pointer to an `NSError`
 object describing the error. Pass in `NULL` to ignore any error.

 @return `YES` if `source` was removed successfully. If `NO`, `outError` contains
 an `NSError` object describing the problem.
 */
- (BOOL)removeSource:(MGLSource *)source error:(NSError * __nullable * __nullable)outError;

#pragma mark Managing Style Layers

/**
 The layers included in the style, arranged according to their back-to-front
 ordering on the screen.
 */
@property (nonatomic, strong) NSArray<__kindof MGLStyleLayer *> *layers;

/**
 Returns a style layer with the given identifier in the current style.

 @note Layer identifiers are not guaranteed to exist across styles or different
    versions of the same style. Applications that use this API must first set
    the style URL to an explicitly versioned style using a convenience method like
    `+[MGLStyle outdoorsStyleURLWithVersion:]`, `MGLMapView`’s “Style URL”
    inspectable in Interface Builder, or a manually constructed `NSURL`. This
    approach also avoids layer identifier name changes that will occur in the default
    style’s layers over time.

 @return An instance of a concrete subclass of `MGLStyleLayer` associated with
    the given identifier, or `nil` if the current style contains no such style
    layer.
 */
- (nullable MGLStyleLayer *)layerWithIdentifier:(NSString *)identifier;

/**
 Adds a new layer on top of existing layers.

 @note Adding the same layer instance more than once will result in a
    `MGLRedundantLayerException`. Reusing the same layer identifier, even with
    different layer instances, will also result in an exception.

 @note Layers should be added in
    `-[MGLMapViewDelegate mapView:didFinishLoadingStyle:]` or
    `-[MGLMapViewDelegate mapViewDidFinishLoadingMap:]` to ensure that the map
    has loaded the style and is ready to accept a new layer.

 @param layer The layer object to add to the map view. This object must be an
    instance of a concrete subclass of `MGLStyleLayer`.
 */
- (void)addLayer:(MGLStyleLayer *)layer;

/**
 Inserts a new layer into the style at the given index.

 @note Adding the same layer instance more than once will result in a
    `MGLRedundantLayerException`. Reusing the same layer identifier, even with
    different layer instances, will also result in an exception.

 @note Layers should be added in
    `-[MGLMapViewDelegate mapView:didFinishLoadingStyle:]` or
    `-[MGLMapViewDelegate mapViewDidFinishLoadingMap:]` to ensure that the map
    has loaded the style and is ready to accept a new layer.

 @param layer The layer to insert.
 @param index The index at which to insert the layer. An index of 0 would send
    the layer to the back; an index equal to the number of objects in the
    `layers` property would bring the layer to the front.
 */
- (void)insertLayer:(MGLStyleLayer *)layer atIndex:(NSUInteger)index;

/**
 Inserts a new layer below another layer.

 @note Layer identifiers are not guaranteed to exist across styles or different
    versions of the same style. Applications that use this API must first set
    the style URL to an explicitly versioned style using a convenience method like
    `+[MGLStyle outdoorsStyleURLWithVersion:]`, `MGLMapView`’s “Style URL”
    inspectable in Interface Builder, or a manually constructed `NSURL`. This
    approach also avoids layer identifier name changes that will occur in the default
    style’s layers over time.

    Inserting the same layer instance more than once will result in a
    `MGLRedundantLayerException`. Reusing the same layer identifier, even with
    different layer instances, will also result in an exception.

 @param layer The layer to insert.
 @param sibling An existing layer in the style.

 #### Related examples
 See the <a href="https://docs.mapbox.com/ios/maps/examples/shape-collection/">
 Add multiple shapes from a single shape source</a> example to learn how to
 add a layer to your map below an existing layer.
 */
- (void)insertLayer:(MGLStyleLayer *)layer belowLayer:(MGLStyleLayer *)sibling;

/**
 Inserts a new layer above another layer.

 @note Layer identifiers are not guaranteed to exist across styles or different
    versions of the same style. Applications that use this API must first set
    the style URL to an explicitly versioned style using a convenience method like
    `+[MGLStyle outdoorsStyleURLWithVersion:]`, `MGLMapView`’s “Style URL”
    inspectable in Interface Builder, or a manually constructed `NSURL`. This
    approach also avoids layer identifier name changes that will occur in the default
    style’s layers over time.

    Inserting the same layer instance more than once will result in a
    `MGLRedundantLayerException`. Reusing the same layer identifier, even with
    different layer instances, will also result in an exception.

 @param layer The layer to insert.
 @param sibling An existing layer in the style.

 #### Related examples
 See the <a href="https://docs.mapbox.com/ios/maps/examples/image-source/">
 Add an image</a> example to learn how to add a layer to your map above an
 existing layer.
 */
- (void)insertLayer:(MGLStyleLayer *)layer aboveLayer:(MGLStyleLayer *)sibling;

/**
 Removes a layer from the map view.

 @note Layer identifiers are not guaranteed to exist across styles or different
    versions of the same style. Applications that use this API must first set
    the style URL to an explicitly versioned style using a convenience method like
    `+[MGLStyle outdoorsStyleURLWithVersion:]`, `MGLMapView`’s “Style URL”
    inspectable in Interface Builder, or a manually constructed `NSURL`. This
    approach also avoids layer identifier name changes that will occur in the default
    style’s layers over time.

 @param layer The layer object to remove from the map view. This object
 must conform to the `MGLStyleLayer` protocol.
 */
- (void)removeLayer:(MGLStyleLayer *)layer;

#pragma mark TrimbleMap Layers

- (bool)isTrafficVisible;
- (void)setTrafficVisibility:(bool)isVisible;
- (void)toggleTrafficVisibility;
- (bool)isWeatherAlertVisible;
- (void)setWeatherAlertVisibility:(bool)isVisible;
- (void)toggleWeatherAlertVisibility;
- (bool)isWeatherRadarVisible;
- (void)setWeatherRadarVisibility:(bool)isVisible;
- (void)toggleWeatherRadarVisibility;
- (bool)isRoadSurfaceVisible;
- (void)setRoadSurfaceVisibility:(bool)isVisible;
- (void)toggleRoadSurfaceVisibility;
- (bool)is3dBuildingVisible;
- (void)set3dBuildingVisibility:(bool)isVisible;
- (void)toggle3dBuildingVisibility;
- (bool)isPoiVisible;
- (void)setPoiVisibility:(bool)isVisible;
- (void)togglePoiVisibility;
- (bool)isAddressVisible;
- (void)setAddressVisibility:(bool)isVisible;
- (void)toggleAddressVisibility;


#pragma mark Managing a Style’s Images

/**
 Returns the image associated with the given name in the style.

 @note Names and their associated images are not guaranteed to exist across
    styles or different versions of the same style. Applications that use this
    API must first set the style URL to an explicitly versioned style using a
    convenience method like `+[MGLStyle outdoorsStyleURLWithVersion:]`,
    `MGLMapView`’s “Style URL” inspectable in Interface Builder, or a manually
    constructed `NSURL`. This approach also avoids image name changes that will
    occur in the default style over time.

 @param name The name associated with the image you want to obtain.
 @return The image associated with the given name, or `nil` if no image is
    associated with that name.
 */
- (nullable MGLImage *)imageForName:(NSString *)name;

/**
 Adds or overrides an image used by the style’s layers.

 To use an image in a style layer, give it a unique name using this method, then
 set the `iconImageName` property of an `MGLSymbolStyleLayer` object to that
 name.

 @param image The image for the name.
 @param name The name of the image to set to the style.

 #### Related examples
 See the <a href="https://docs.mapbox.com/ios/maps/examples/clustering-with-images/">
 Use images to cluster point data</a> and <a href="https://docs.mapbox.com/ios/maps/examples/clustering/">
 Cluster point data</a> examples to learn how to add images to your map using
 an `MGLStyle` object.
 */
- (void)setImage:(MGLImage *)image forName:(NSString *)name;

/**
 Removes a name and its associated image from the style.

 @note Names and their associated images are not guaranteed to exist across
    styles or different versions of the same style. Applications that use this
    API must first set the style URL to an explicitly versioned style using a
    convenience method like `+[MGLStyle outdoorsStyleURLWithVersion:]`,
    `MGLMapView`’s “Style URL” inspectable in Interface Builder, or a manually
    constructed `NSURL`. This approach also avoids image name changes that will
    occur in the default style over time.

 @param name The name of the image to remove.
 */
- (void)removeImageForName:(NSString *)name;


#pragma mark Managing the Style's Light

/**
 Provides global light source for the style.
 */
@property (nonatomic, strong) MGLLight *light;

#pragma mark Localizing Map Content

/**
 Attempts to localize labels in the style into the given locale.

 This method automatically modifies the text property of any symbol style layer
 in the style whose source is the
 <a href="https://www.mapbox.com/vector-tiles/mapbox-streets-v8/#overview">Mapbox Streets source</a>.
 On iOS, the user can set the system’s preferred language in Settings, General
 Settings, Language & Region. On macOS, the user can set the system’s preferred
 language in the Language & Region pane of System Preferences.

 @param locale The locale into which labels should be localized. To use the
    system’s preferred language, if supported, specify `nil`. To use the local
    language, specify a locale with the identifier `mul`.
 */
- (void)localizeLabelsIntoLocale:(nullable NSLocale *)locale;

@end

/**
 An object whose contents are represented by an `MGLStyle` object that you
 configure.
 */
@protocol MGLStylable <NSObject>

/**
 The style currently displayed in the receiver.

 @note The default styles provided by Mapbox contain sources and layers with
    identifiers that will change over time. Applications that use APIs that
    manipulate a style’s sources and layers must first set the style URL to an
    explicitly versioned style using a convenience method like
    `+[MGLStyle outdoorsStyleURLWithVersion:]` or a manually constructed
     `NSURL`.
 */
@property (nonatomic, readonly, nullable) MGLStyle *style;

@end

NS_ASSUME_NONNULL_END
