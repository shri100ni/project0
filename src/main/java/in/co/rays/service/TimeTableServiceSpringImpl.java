package in.co.rays.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import in.co.rays.dao.TimeTableDAOInt;
import in.co.rays.dto.TimeTableDTO;
import in.co.rays.exception.DuplicateRecordException;
// TODO: Auto-generated Javadoc

/**
 * The Class TimeTableServiceSpringImpl.
 */
@Service
public class TimeTableServiceSpringImpl implements TimeTableServiceInt{
    
    /** The dao. */
    @Autowired
	TimeTableDAOInt dao;

/** The log. */
private static Logger log = Logger.getLogger(TimeTableServiceSpringImpl.class);
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.TimeTableServiceInt#add(in.co.rays.dto.TimeTableDTO)
	 */
	@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = false)
    public long add(TimeTableDTO dto) throws DuplicateRecordException {

    	log.debug("CourseServiceSpringImpl Add Started");
    	TimeTableDTO dtoExist1 = dao.findTimeTableDuplicacy(dto.getCourseId(), dto.getSubjectId(), dto.getExamDate());
    	TimeTableDTO dtoExist2 = dao.findTimeTableDuplicacy(dto.getCourseId(), dto.getSemester(), dto.getExamDate());
    	TimeTableDTO dtoExist3 = dao.findTimeTableDuplicacy(dto.getCourseId(), dto.getSemester(), dto.getSubjectId());
    	if (dtoExist1 != null||dtoExist2!=null||dtoExist3!=null) {
            throw new DuplicateRecordException("TimeTable already exists");
        }
        long pk = dao.add(dto);
        log.debug("CourseServiceSpringImpl Add End");
        return pk;
	}
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.TimeTableServiceInt#update(in.co.rays.dto.TimeTableDTO)
	 */
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void update(TimeTableDTO dto) throws DuplicateRecordException {
		log.debug("CourseServiceSpringImpl update Started");
		TimeTableDTO dtoExist1 = dao.findTimeTableDuplicacy(dto.getCourseId(), dto.getSubjectId(), dto.getExamDate());
    	TimeTableDTO dtoExist2 = dao.findTimeTableDuplicacy(dto.getCourseId(), dto.getSemester(), dto.getExamDate());
    	TimeTableDTO dtoExist3 = dao.findTimeTableDuplicacy(dto.getCourseId(), dto.getSemester(), dto.getSubjectId());
    	
    	if (dtoExist1 != null&&dtoExist1.getId()!=dto.getId()) {
            throw new DuplicateRecordException("TimeTable already exists");
        }if (dtoExist2!=null&&dtoExist2.getId()!=dto.getId()) {
            throw new DuplicateRecordException("TimeTable already exists");
        }if (dtoExist3!=null&&dtoExist3.getId()!=dto.getId()) {
            throw new DuplicateRecordException("TimeTable already exists");
        }
		
		dao.update(dto);
		
    	log.debug("CourseServiceSpringImpl update End");
	}
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.TimeTableServiceInt#delete(long)
	 */
	@Transactional(propagation = Propagation.REQUIRES_NEW, readOnly = false)
	public void delete(long id) {
		log.debug("CourseServiceSpringImpl delete Started");
	   	 dao.delete(id);
	   	log.debug("CourseServiceSpringImpl delete End");
		
	}
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.TimeTableServiceInt#findByPk(long)
	 */
	@Transactional( readOnly = false)
	public TimeTableDTO findByPk(long id) {
		log.debug("CourseServiceSpringImpl findById Started");
		TimeTableDTO dto = dao.findByPK(id);
    	log.debug("CourseServiceSpringImpl findById End");
    	return dto;
	}

	
	/* (non-Javadoc)
	 * @see in.co.rays.service.TimeTableServiceInt#search(in.co.rays.dto.TimeTableDTO, int, int)
	 */
	@Transactional( readOnly = false)
	public List<TimeTableDTO> search(TimeTableDTO dto, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return dao.search(dto, pageNo, pageSize);
	}
	
	/* (non-Javadoc)
	 * @see in.co.rays.service.TimeTableServiceInt#search(in.co.rays.dto.TimeTableDTO)
	 */
	@Transactional( readOnly = false)
	public List<TimeTableDTO> search(TimeTableDTO dto) {
		// TODO Auto-generated method stub
		return dao.search(dto);
	}

}
