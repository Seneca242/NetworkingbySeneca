//
//  CourseCell.swift
//  NetworkingbySeneca
//
//  Created by Дмитрий Дмитрий on 08.01.2022.
//

import UIKit

class CourseCell: UITableViewCell {
    
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    
    func configure(with course: Course) {
        courseNameLabel.text = course.name
        numberOfLessons.text = "Number of lessons: \(course.number_of_lessons ?? 0)"
        numberOfTests.text = "Number of tests: \(course.number_of_tests ?? 0)"
        
        guard let url = URL(string: course.imageUrl ?? "") else { return }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData )
            }
        }
    }
}
