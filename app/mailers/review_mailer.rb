class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review

    mail(
      to: review.item.user.email,
      subject: "New Review for #{review.item.name}"
    )
  end
end
