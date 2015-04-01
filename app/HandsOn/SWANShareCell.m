//
//  SWANShareCell.m
//  HandsOn
//
//  Created by Pasquale Barilla on 1/04/2015.
//  Copyright (c) 2015 The Swan Factory. All rights reserved.
//

#import "SWANShareCell.h"

@implementation SWANShareCell

- (void)awakeFromNib {
    // Initialization code
    self.dataSource = @[@1,@1,@1];
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"SWANIndividualCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CollectionCell"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureWithArray:(NSArray *)array {
    self.dataSource = array;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SWANIndividualCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    //4, 147, 114
    cell.backgroundColor = [UIColor colorWithRed:4.0f/255.0f green:147.0f/255.0f blue:144.0f/255.0f alpha:1.0];
    [cell configWithTitle:self.dataSource[indexPath.row]];
//    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.dataSource[indexPath.row]]];
//    [cell addSubview:image];
    return cell;
}

@end
