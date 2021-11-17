class UspsVerifyOrganizer
  include Interactor::Organizer

  organize BuildQueryString, CallUsps
end
