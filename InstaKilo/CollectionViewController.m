//
//  CollectionViewController.m
//  InstaKilo
//
//  Created by Chris Dean on 2018-02-28.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "CollectionViewController.h"
#import "PhotoObject.h"
#import "MyCollectionViewCell.h"

@interface CollectionViewController ()

@property (nonatomic) NSMutableArray *photoObjects;
@property (nonatomic) UICollectionViewFlowLayout *simpleLayout;
@property (nonatomic) NSMutableArray *arrayOfSections;
@property (nonatomic) NSMutableArray *arrayOfArrays;

@end


@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.photoObjects = [[NSMutableArray alloc] init];
    self.arrayOfSections = [[NSMutableArray alloc] init];
    self.arrayOfArrays = [[NSMutableArray alloc] init];
    
    [self addPhotoObject:@"back_porch" withLocation:@"MyHouse" withSubject:@"outside"];
    [self addPhotoObject:@"bathroom" withLocation:@"MyHouse" withSubject:@"inside"];
    [self addPhotoObject:@"bedroom" withLocation:@"MyHouse" withSubject:@"inside"];
    [self addPhotoObject:@"coat_room" withLocation:@"MyHouse" withSubject:@"inside"];
    [self addPhotoObject:@"cursed_chalice" withLocation:@"HannahsHouse" withSubject:@"outside"];
    [self addPhotoObject:@"dining_room" withLocation:@"HannahsHouse" withSubject:@"inside"];
    [self addPhotoObject:@"dungeon" withLocation:@"HannahsHouse" withSubject:@"inside"];
    [self addPhotoObject:@"front_door" withLocation:@"HannahsHouse" withSubject:@"outside"];
    [self addPhotoObject:@"generator" withLocation:@"HannahsHouse" withSubject:@"outside"];
    [self addPhotoObject:@"kitchen" withLocation:@"JeremysHouse" withSubject:@"inside"];
    [self addPhotoObject:@"labratory" withLocation:@"JeremysHouse" withSubject:@"inside"];
    [self addPhotoObject:@"library" withLocation:@"JeremysHouse" withSubject:@"inside"];
    [self addPhotoObject:@"mysterious_lake" withLocation:@"JeremysHouse" withSubject:@"outside"];
    [self addPhotoObject:@"secret_passage" withLocation:@"JeremysHouse" withSubject:@"outside"];
    [self addPhotoObject:@"stairs_up" withLocation:@"JeremysHouse" withSubject:@"inside"];
    
    [self sortArraysBySubject];
    // Register cell classes
 //   [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];

}

- (void)addPhotoObject:(NSString*)imageName withLocation:(NSString*)location withSubject:(NSString*)subject {
    UIImage *photo = [UIImage imageNamed:imageName];
    PhotoObject *photoObject = [[PhotoObject alloc] initWithPhoto:photo withLocation:location withSubject:subject];
    [self.photoObjects addObject:photoObject];
}

- (void)sortArraysBySubject {
    
    for(PhotoObject *photoObject in self.photoObjects) {
        
        if([self.arrayOfSections containsObject:photoObject.subject]) {
            NSInteger indexValue = [self.arrayOfSections indexOfObject:photoObject.subject];
            NSMutableArray *mySectionArray = self.arrayOfArrays[indexValue];
            [mySectionArray addObject:photoObject];
        } else {
            [self.arrayOfSections addObject:photoObject.subject];
            NSMutableArray *myPhotoObjectArray = [[NSMutableArray alloc] init];
            [myPhotoObjectArray addObject:photoObject];
            [self.arrayOfArrays addObject:myPhotoObjectArray];
        }
        
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupSimpleLayout {
    //By default, scrolling direction is vertical
    
    self.simpleLayout = [[UICollectionViewFlowLayout alloc] init];
    self.simpleLayout.itemSize = CGSizeMake(100, 100); //Size of cell
    self.simpleLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10); //Padding around each section
    self.simpleLayout.minimumInteritemSpacing = 15; //Min horizontal spacing between cells
    self.simpleLayout.minimumLineSpacing = 10; //Min vertical spacing
    
    //Add this line so headers will appear
    self.simpleLayout.headerReferenceSize = CGSizeMake(30, self.collectionView.frame.size.height);
    
    //Add this line so footers will appear
    self.simpleLayout.footerReferenceSize = CGSizeMake(30, self.collectionView.frame.size.height);
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.arrayOfSections.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSMutableArray *array  = [[NSMutableArray alloc] init];
    array = self.arrayOfArrays[section];
    return array.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    NSMutableArray *array  = [[NSMutableArray alloc] init];
    array = self.arrayOfArrays[indexPath.section];
    
    PhotoObject *photoObject = array[indexPath.row];
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.imageView.image = photoObject.myPhoto;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
